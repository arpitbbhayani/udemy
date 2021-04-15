from flask import Flask, jsonify
from udemy.db import connection

app = Flask(__name__)


@app.route("/")
def view_index():
    with connection.cursor() as cursor:
        cursor.execute("SELECT 1")
    return jsonify({})
