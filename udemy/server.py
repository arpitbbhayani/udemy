from flask import Flask, jsonify
from udemy.services.topics import get_topic

app = Flask(__name__)


@app.route("/topics/<topic_id>")
def view_topics_get(topic_id):
    topic = get_topic(topic_id)
    return jsonify(topic)
