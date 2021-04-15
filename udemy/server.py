from flask import Flask, jsonify
from udemy.services.topics import get_topic

app = Flask(__name__)


@app.errorhandler(Exception)
def handle_generic_exception(exc):
    return {
        "error": str(exc),
    }


@app.route("/topics/<topic_id>")
def view_topics_get(topic_id):
    topic = get_topic(topic_id)
    return jsonify(topic)
