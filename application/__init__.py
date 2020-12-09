from flask import flask
from flask_sqlalchemy import SQLAlchemy

app = Flash(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:root@35.246.60.242/flaskdb"

db = SQLAlchemy(app)

from application import routes