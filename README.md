# 2110322-db-sys-project

#### Group: NoSQL is the best

-----

### Prerequisite

* Install Python 3.6++
* Install MySQL/MariaDB/Percona

### Setting up web server

#### Setting up environment

```sh
# Install pipenv
pip install pipenv
# Install Dependencies
pipenv install
```

#### Setting up config file

1. create a folder named "instance" in the root of the project's repository.
2. create a file named "config.py" inside that "instance" folder.

The config which include sensitve data like password, secret, etc. should be put in this file.

#### Setting up mysql connection

open config.py inside instance folder and add "DATABASE" variable to the file.

```py
# file: instance/config.py
DATABASE = {
    'host': 'localhost',
    'database': 'your_database',
    'user': 'your_database_user',
    'password': 'your_database_user_password',
    'charset': 'utf8mb4',
    'use_unicode': True
}
```

#### Running development server

```sh
# Switch to pipenv enviroment
pipenv shell

# Running development server in osx/linux
export FLASK_APP=server
export FLASK_ENV=development
flask run

# Running development server in windows(CMD)
set FLASK_APP=server
set FLASK_ENV=development
flask run
```

#### Running production server

```sh
# Running production server
pipenv run gunicorn -w 4 -b 127.0.0.1:5000 server.wsgi:app
```

### Coding style guide

1. Use snake_case for function, method and variable name. Ex. foo_bar, ant_cat_dog
2. Use PascalCase for class name. Ex. FooBar, AntCatDog
3. 4 Tab spaces for every python files.
4. Use space instead of tab character for indentation. (Python usually produce parsing error if we mix tabs and spaces).
5. Just install editorconfig plugin for your code editor and everything should be okay.
