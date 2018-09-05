from flask import Blueprint, render_template, jsonify
from server.db import connection

index_bp = Blueprint('index', __name__)

@index_bp.route('/', methods=('GET',))
def index_handler():
    return render_template('index.html', stacks=['Python', 'Flask', 'MySQL'])

@index_bp.route('/test-json', methods=('GET',))
def test_json_handler():
    return jsonify({
        'Hello': 'World',
        'Foo': ['Bar']
    })

@index_bp.route('/test-db', methods=('GET',))
def test_db_handler():
    db = connection.get_db()
    if db.is_connected():
        return 'Database connected'
    return 'Cannot connect to database'
