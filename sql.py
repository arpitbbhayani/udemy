import os
import sys
import pymysql.cursors

if len(sys.argv) < 2:
    printf(f"{sys.argv[0]} <sql file>")
    sys.exit(1)

filename = sys.argv[1]

from udemy.db import connection

with connection.cursor() as cursor:
    with open(filename, "r") as fp:
        statements = fp.read().split(';')
        for statement in statements:
            statement = statement.strip()
            if statement:
                cursor.execute(statement)

connection.commit()
