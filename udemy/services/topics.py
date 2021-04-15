from udemy.db import connection


def get_topic(topic_id):
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT id, name, type from topics where id = %s;
        """, [topic_id])
        result = cursor.fetchone()

        if not result:
            raise Exception("topic/not_found")

    return {
        'id': result['id'],
        'name': result['name'],
        'type': result['type'],
    }
