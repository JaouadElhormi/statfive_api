import os


class Development:
    DEBUG = False
    TESTING = False
    JWT_SECRET_KEY = "secret"
    SECRET_KEY = 'secret!'
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'jaouad'
    MYSQL_PASSWORD = ''
    MYSQL_DB = 'statfive'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_DATABASE_URI = f"mysql://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}/{MYSQL_DB}"


class Docker:
    JWT_SECRET_KEY = os.environ.get('JWT_SECRET_KEY', 'secret!')
    SECRET_KEY = os.environ.get('SECRET_KEY', 'secret!')
    MYSQL_USER = os.environ.get('MYSQL_USER', 'statfive')
    MYSQL_PASSWORD = os.environ.get('MYSQL_PASSWORD', 'statfive')
    MYSQL_HOST = os.environ.get('MYSQL_HOST', 'db')
    MYSQL_DB = os.environ.get('MYSQL_DB', 'statfive')
    SQLALCHEMY_DATABASE_URI = f"mysql://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}/{MYSQL_DB}"
    SQLALCHEMY_TRACK_MODIFICATIONS = os.environ.get('SQLALCHEMY_DATABASE_URI', False)


app_config = {
    'development': Development,
    'docker': Docker
}