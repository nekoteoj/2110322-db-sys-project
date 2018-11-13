from flask import Blueprint, jsonify, request
from server.db import connection
from server.models import seller_to_dict, item_to_dict

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

@bp.route('/item', methods=('GET',))
def get_item():
    item_id = request.args.get('id')
    if item_id is None:
        response = jsonify({'error': 'Invalid request'})
        response.status_code = 400
        return response
    db = connection.get_db()
    cursor = db.cursor()
    cursor.execute('SELECT * FROM item WHERE id = %s', [item_id])
    row = cursor.fetchone()
    if row is None:
        response = jsonify({'error': 'No item found'})
        response.status_code = 400
        return response
    return jsonify(item_to_dict(row))

@bp.route('/seller')
def get_sellers():
    db = connection.get_db()
    cursor = db.cursor()
    cursor.execute('SELECT * FROM seller')
    rows = cursor.fetchmany()
    return jsonify([seller_to_dict(row) for row in rows])

@bp.route('/seller/items', methods=('GET',))
def get_seller_items():
    seller_ssn = request.args.get('ssn')
    if seller_ssn is None:
        response = jsonify({'error': 'Invalid request'})
        response.status_code = 400
        return response
    db = connection.get_db()
    cursor = db.cursor()
    cursor.execute('SELECT * FROM item WHERE seller_ssn = %s', [seller_ssn])
    rows = cursor.fetchmany()
    return jsonify([item_to_dict(row) for row in rows])
