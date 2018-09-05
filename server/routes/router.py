from .index import index_bp

def init_route(app):
    app.register_blueprint(index_bp)
