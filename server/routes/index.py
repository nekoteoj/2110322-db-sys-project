from flask import Blueprint, jsonify
from server.db import connection

bp = Blueprint('index', __name__, url_prefix='/api')

@bp.route('/test-json', methods=('GET',))
def test_json_handler():
    return jsonify({
        'Hello': 'World',
        'Foo': ['Bar']
    })

@bp.route('/test-db', methods=('GET',))
def test_db_handler():
    db = connection.get_db()
    if db.is_connected():
        return 'Database connected'
    return 'Cannot connect to database'
