import json
import psycopg2
import datetime
import rally


def myconverter(o):
    if isinstance(o, datetime.datetime):
        return o.__str__()

def db(database_name='rally_data'):
    return psycopg2.connect("dbname=rally_data user=readonly password=readonly host=localhost")

def query_db(query, args=(), one=False):
    cur = db().cursor()
    cur.execute(query, args)
    r = [dict((cur.description[i][0], value) \
               for i, value in enumerate(row)) for row in cur.fetchall()]
    cur.connection.close()
    return (r[0] if r else None) if one else r

my_query = query_db("select * from release")

json_output = json.dumps(my_query, default = myconverter)
print json_output

