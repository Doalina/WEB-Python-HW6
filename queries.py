import sqlite3


def execute_query() -> list:
    query_num = input('Please, input query number: ')
    query = 'queries/query_' + query_num + '.sql'

    with open(query, 'r') as q:
        sql = q.read()

    with sqlite3.connect('hw_6.db') as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()


print(execute_query())