import os

from flask import send_file, send_from_directory, url_for
from flask_cors import CORS
from . import index

STATIC_PATH = os.path.join(os.path.abspath(os.path.dirname(__file__)), '../static')

def init_route(app):
    CORS(app)

    app.register_blueprint(index.bp)

    @app.route('/', defaults={'path': ''})
    @app.route('/<path:path>')
    def frontend_handler(path):
        if os.path.isfile(os.path.join(STATIC_PATH, path)):
            return send_from_directory(STATIC_PATH, path)
        return send_file('static/index.html')
