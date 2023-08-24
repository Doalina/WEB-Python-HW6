import sqlite3


def create_db():
    with open('create_db.sql', 'r') as db:
        sql = db.read()

    with sqlite3.connect('hw_6.db') as con:
        cur = con.cursor()
        cur.executescript(sql)


if __name__ == "__main__":
    create_db()