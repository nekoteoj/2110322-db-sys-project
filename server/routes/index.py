from flask import Blueprint, jsonify, request
from server.db import connection
from server.models import row_to_dict, rows_to_dict_list

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
        return 'Bad request', 400
    db = connection.get_db()
    cursor = db.cursor()
    cursor.execute('SELECT * FROM item WHERE id = %s', [item_id])
    row = cursor.fetchone()
    if row is None:
        return 'Not found', 404
    result = row_to_dict(cursor.description, row)
    cursor.execute('SELECT image_url FROM item_image WHERE item_id = %s', [item_id])
    rows = cursor.fetchall()
    result['images'] = [e[0] for e in rows]
    return jsonify(result)

@bp.route('/item', methods=('POST',))
def create_item():
    description = request.form.get('description')
    price = request.form.get('price')
    product_name = request.form.get('product_name')
    product_brand = request.form.get('product_brand')
    supplier = request.form.get('supplier')
    quantity = request.form.get('quantity')
    category_id = request.form.get('category_id')
    seller_ssn = request.form.get('seller_ssn')
    images = request.form.get('images')
    if price is None or product_name is None or product_brand is None or supplier is None or quantity is None or category_id is None or seller_ssn is None:
        response = jsonify({'error': 'Not enough parameters'})
        response.status_code = 400
        return response
    db = connection.get_db()
    cursor = db.cursor()
    cursor.execute('INSERT INTO item VALUES (NULL, %s, %s, %s, %s, NOW(), NOW(), %s, %s, %s, %s)',
        [description, price, product_name, product_brand, supplier, quantity, category_id, seller_ssn]
    )
    item_id = cursor.lastrowid
    if images is not None:
        images = images.split('|||')
        for image in images:
            if len(image) > 0:
                cursor.execute('INSERT INTO item_image VALUES (%s, %s)', [item_id, image])
    db.commit()
    return jsonify({'status': 'OK'})

@bp.route('/item', methods=('PUT',))
def edit_item():
    item_id = request.form.get('id')
    description = request.form.get('description')
    price = request.form.get('price')
    product_name = request.form.get('product_name')
    product_brand = request.form.get('product_brand')
    supplier = request.form.get('supplier')
    quantity = request.form.get('quantity')
    category_id = request.form.get('category_id')
    seller_ssn = request.form.get('seller_ssn')
    images = request.form.get('images')
    if item_id is None:
        response = jsonify({'error': 'Not enough parameters'})
        response.status_code = 400
        return response
    cols = []
    data = []
    if description is not None:
        cols.append('description')
        data.append(description)
    if price is not None:
        cols.append('price')
        data.append(price)
    if product_name is not None:
        cols.append('product_name')
        data.append(product_name)
    if product_brand is not None:
        cols.append('product_brand')
        data.append(product_brand)
    if supplier is not None:
        cols.append('supplier')
        data.append(supplier)
    if quantity is not None:
        cols.append('quantity')
        data.append(quantity)
    if category_id is not None:
        cols.append('category_id')
        data.append(category_id)
    if seller_ssn is not None:
        cols.append('seller_ssn')
        data.append(seller_ssn)
    db = connection.get_db()
    cursor = db.cursor()
    cursor.execute('UPDATE item SET time_updated=NOW()' + ''.join([', ' + e + '=%s' for e in cols]) + ' WHERE id = %s',data + [item_id])
    if images is not None:
        images = images.split('|||')
        cursor.execute('DELETE FROM item_image WHERE item_id = %s', [item_id])
        for image in images:
            if len(image) > 0:
                cursor.execute('INSERT INTO item_image VALUES (%s, %s)', [item_id, image])
    db.commit()
    return jsonify({'status': 'OK'})


@bp.route('/item', methods=('DELETE',))
def delete_item():
    item_id = request.form.get('id')
    if item_id is None:
        data = str(request.data, 'utf-8').split('=')
        try:
            index = data.index('id')
            item_id = data[index + 1]
        except:
            response = jsonify({'error': 'Invalid request'})
            response.status_code = 400
            return response
    db = connection.get_db()
    cursor = db.cursor()
    cursor.execute('DELETE FROM item WHERE id = %s', [item_id])
    db.commit()
    return jsonify({'status': 'OK'})

@bp.route('/category')
def get_category():
    category_id = request.args.get('id')
    if not category_id:
        return 'Bad request', 400
    db = connection.get_db()
    cursor = db.cursor()
    cursor.execute('SELECT * FROM category where id = %s', [category_id])
    row = cursor.fetchone()
    if not row:
        return 'Not found', 404
    return jsonify(row_to_dict(cursor.description, row))

@bp.route('/seller')
def get_sellers():
    db = connection.get_db()
    cursor = db.cursor()
    cursor.execute('SELECT * FROM seller')
    rows = cursor.fetchall()
    return jsonify(rows_to_dict_list(cursor.description, rows))

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
    rows = cursor.fetchall()
    result = rows_to_dict_list(cursor.description, rows)
    for item in result:
        cursor.execute('SELECT image_url FROM item_image WHERE item_id = %s', [item['id']])
        rows = cursor.fetchall()
        item['images'] = [e[0] for e in rows]
    return jsonify(result)
