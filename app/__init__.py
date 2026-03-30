from flask import Flask, jsonify, request
from flask_cors import CORS
from .extensions import mysql
from .config import Config
import os


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    app.url_map.strict_slashes = False

    mysql.init_app(app)

    allowed_origins = [
        origin.strip()
        for origin in os.getenv("ALLOWED_ORIGINS", "").split(",")
        if origin.strip()
    ]

    cors_resources = {
        r"/api/*": {
            "origins": allowed_origins or "*",
            "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
            "allow_headers": ["Authorization", "Content-Type"],
            "supports_credentials": True,
        }
    }
    CORS(app, resources=cors_resources)

    @app.before_request
    def handle_preflight():
        if request.method == "OPTIONS":
            return ("", 204)

    from .routes.auth import auth_bp
    from .routes.trains import trains_bp

    app.register_blueprint(auth_bp, url_prefix="/api")
    app.register_blueprint(trains_bp, url_prefix="/api/trains")

    @app.route("/")
    def home():
        return jsonify({"success": True, "message": "Train API v1.0"})

    @app.route("/health")
    def health():
        return jsonify({"success": True, "message": "API is running"})

    return app
