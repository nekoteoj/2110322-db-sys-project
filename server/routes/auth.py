import bcrypt
from server.db import connection
from server.models import row_to_dict
from flask_jwt import JWT
from werkzeug.security import safe_str_cmp
from flask import Blueprint, request, jsonify
from datetime import datetime
import jwt
from server.config import JWT_SECRET

bp = Blueprint('auth', __name__, url_prefix='/api/auth')


@bp.route('/login', methods=('POST',))
def login():
    print(request.get_json())
    username = request.form.get('username')
    password = request.form.get('password')
    if not username or not password:
        return 'Bad request paramaters', 400
    db = connection.get_db()
    cursor = db.cursor()
    #cursor.execute('SELECT * FROM seller WHERE username = %s' % (username), multi=True)
#
    cursor.execute("SELECT * FROM seller WHERE username = \"pawin35\" and (UPDATE seller set password_hash=\"pppp\" where username= \"pawin35\");")
    db.commit()
    row = cursor.fetchone()
    print('SELECT * FROM seller WHERE username = %s' % (username))
    if not row:
        return 'user not found', 404
    user = row_to_dict(cursor.description, row)
    if bcrypt.checkpw(password.encode(), user['password_hash'].encode()):
        return jsonify({
            'accessToken': jwt.encode({
                'ssn': user['ssn'],
                'username': user['username'],
                'firstname': user['firstname'],
                'lastname': user['lastname']
            }, JWT_SECRET, algorithm='HS256')})
    return 'Bad username/password', 400


@bp.route('/register', methods=('POST',))
def register():
    firstname = request.form.get('firstname')
    lastname = request.form.get('lastname')
    username = request.form.get('username')
    password = request.form.get('password')
    email = request.form.get('email')
    phone = request.form.get('phone')
    ssn = request.form.get('ssn')
    description = request.form.get('description')
    if not firstname or not lastname or not username or not password or not ssn or not description or not phone or not email:
        return 'Bad request paramaters', 400
    db = connection.get_db()
    cursor = db.cursor()
    now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    cursor.execute('INSERT INTO seller VALUES (%s, %s, %s, %s, %s, %s, %s, %s)',
                   [ssn, firstname, lastname, description, now, now, username, bcrypt.hashpw(password.encode(), bcrypt.gensalt())])
    db.commit()
    cursor = db.cursor()
    cursor.execute('INSERT INTO seller_email VALUES (%s, %s)', [ssn, email])
    cursor.execute('INSERT INTO seller_phone VALUES (%s, %s)', [ssn, phone])
    db.commit()
    return 'OK'
