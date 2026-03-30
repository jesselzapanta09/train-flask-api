from flask import Blueprint, request, jsonify
from app.utils.db import get_cursor
from app.middleware.auth import authenticate_token
from app.extensions import mysql

trains_bp = Blueprint("trains", __name__)


# ── GET ALL TRAINS ─────────────────────────
@trains_bp.route("/", methods=["GET"])
@authenticate_token
def get_trains():
    cur = get_cursor()
    cur.execute("SELECT * FROM trains ORDER BY id DESC")
    trains = cur.fetchall()
    return jsonify({"success": True, "count": len(trains), "data": trains})


# ── GET SINGLE TRAIN ───────────────────────
@trains_bp.route("/<int:id>", methods=["GET"])
@authenticate_token
def get_train(id):
    cur = get_cursor()
    cur.execute("SELECT * FROM trains WHERE id=%s", (id,))
    train = cur.fetchone()
    if not train:
        return jsonify({"success": False, "message": "Train not found"}), 404
    return jsonify({"success": True, "data": train})


# ── CREATE TRAIN ───────────────────────────
@trains_bp.route("/", methods=["POST"])
@authenticate_token
def create_train():
    data = request.get_json(silent=True) or {}

    train_name = data.get("train_name")
    price = data.get("price")
    route = data.get("route")

    if not train_name or price is None or not route:
        return jsonify({"success": False, "message": "train_name, price, and route are required"}), 400

    cur = get_cursor()
    cur.execute(
        "INSERT INTO trains (train_name, price, route) VALUES (%s, %s, %s)",
        (train_name, price, route),
    )
    mysql.connection.commit()

    return jsonify({"success": True, "message": "Train created", "data": {"id": cur.lastrowid}}), 201


# ── UPDATE TRAIN ───────────────────────────
@trains_bp.route("/<int:id>", methods=["PUT"])
@authenticate_token
def update_train(id):
    data = request.get_json(silent=True) or {}

    train_name = data.get("train_name")
    price = data.get("price")
    route = data.get("route")

    if not train_name or price is None or not route:
        return jsonify({"success": False, "message": "train_name, price, and route are required"}), 400

    cur = get_cursor()
    cur.execute("SELECT id FROM trains WHERE id=%s", (id,))
    if not cur.fetchone():
        return jsonify({"success": False, "message": "Train not found"}), 404

    cur.execute(
        "UPDATE trains SET train_name=%s, price=%s, route=%s WHERE id=%s",
        (train_name, price, route, id),
    )
    mysql.connection.commit()

    return jsonify({
        "success": True,
        "message": "Train updated",
        "data": {"id": id, "train_name": train_name, "price": price, "route": route},
    })


# ── DELETE TRAIN ───────────────────────────
@trains_bp.route("/<int:id>", methods=["DELETE"])
@authenticate_token
def delete_train(id):
    cur = get_cursor()
    cur.execute("SELECT id FROM trains WHERE id=%s", (id,))
    if not cur.fetchone():
        return jsonify({"success": False, "message": "Train not found"}), 404

    cur.execute("DELETE FROM trains WHERE id=%s", (id,))
    mysql.connection.commit()

    return jsonify({"success": True, "message": "Train deleted"})
