import subprocess
from flask import current_app


def execute(sql):
    db_config = current_app.config['DATABASE']
    subprocess.run(f'mysql -u {db_config["user"]} -p{db_config["password"]} {db_config["database"]} -e \'{sql}\'', shell=True, check=True)
