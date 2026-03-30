from datetime import datetime, timedelta
import os

import bcrypt
import jwt
from flask import Blueprint, request, jsonify

from app.extensions import mysql
from app.utils.db import get_cursor
from app.middleware.auth import authenticate_token


auth_bp = Blueprint("auth", __name__)


def create_access_token(user):
    payload = {
        "id": user["id"],
        "email": user["email"],
        "exp": datetime.utcnow() + timedelta(hours=24),
    }
    return jwt.encode(payload, os.getenv("JWT_SECRET"), algorithm="HS256")


@auth_bp.route("/register", methods=["POST"])
def register():
    data = request.get_json(silent=True) or {}
    username = data.get("username")
    email = data.get("email")
    password = data.get("password")

    if not username or not email or not password:
        return jsonify({"success": False, "message": "All fields are required"}), 400

    cur = get_cursor()
    cur.execute("SELECT id FROM users WHERE email=%s OR username=%s", (email, username))
    if cur.fetchone():
        return jsonify({"success": False, "message": "Username or email already exists"}), 409

    hashed = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt()).decode("utf-8")
    cur.execute(
        "INSERT INTO users (username, email, password) VALUES (%s, %s, %s)",
        (username, email, hashed),
    )
    mysql.connection.commit()

    user_id = cur.lastrowid
    return jsonify(
        {
            "success": True,
            "message": "Account created successfully.",
            "data": {"id": user_id, "username": username, "email": email},
        }
    ), 201


@auth_bp.route("/login", methods=["POST"])
def login():
    data = request.get_json(silent=True) or {}
    email = data.get("email")
    password = data.get("password")

    if not email or not password:
        return jsonify({"success": False, "message": "Email and password are required"}), 400

    cur = get_cursor()
    cur.execute("SELECT * FROM users WHERE email=%s", (email,))
    user = cur.fetchone()
    if not user:
        return jsonify({"success": False, "message": "Invalid email or password"}), 401

    if not bcrypt.checkpw(password.encode("utf-8"), user["password"].encode("utf-8")):
        return jsonify({"success": False, "message": "Invalid email or password"}), 401

    access_token = create_access_token(user)
    return jsonify(
        {
            "success": True,
            "message": "Login successful",
            "data": {
                "token": access_token,
                "user": {
                    "id": user["id"],
                    "username": user["username"],
                    "email": user["email"],
                },
            },
        }
    )


@auth_bp.route("/logout", methods=["POST"])
@authenticate_token
def logout():
    token = request.token
    cur = get_cursor()
    cur.execute("INSERT INTO token_blacklist (token) VALUES (%s)", (token,))
    mysql.connection.commit()
    return jsonify({"success": True, "message": "Logged out successfully"})
