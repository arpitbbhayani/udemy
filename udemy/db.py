import pymysql.cursors

from udemy.settings import (
    MYSQL_DATABASE_DB,
    MYSQL_DATABASE_HOST,
    MYSQL_DATABASE_PASSWORD,
    MYSQL_DATABASE_USER)

# Connect to the database
connection = pymysql.connect(host=MYSQL_DATABASE_HOST,
                             user=MYSQL_DATABASE_USER,
                             password=MYSQL_DATABASE_PASSWORD,
                             database=MYSQL_DATABASE_DB,
                             cursorclass=pymysql.cursors.DictCursor)
