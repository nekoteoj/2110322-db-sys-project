from mysql.connector import MySQLConnection, Error
from flask import current_app, g

def get_db():
    if 'db' not in g:
        db_config = current_app.config['DATABASE']
        g.db = MySQLConnection(**db_config)
    return g.db

def close_db(e=None):
    db = g.pop('db', None)
    if db is not None:
        db.close()

def init_app(app):
    app.teardown_appcontext(close_db)
