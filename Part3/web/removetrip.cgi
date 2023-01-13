#!/usr/bin/python3
import psycopg2, cgi
import login

form = cgi.FieldStorage()
takeoff = form.getvalue('takeoff')
arrival = form.getvalue('arrival')
insurance = form.getvalue('insurance')
from_lat = form.getvalue('from_lat')
from_long = form.getvalue('from_long')
to_lat = form.getvalue('to_lat')
to_long = form.getvalue('to_long')
skipper = form.getvalue('skipper')
reserv_start = form.getvalue('reserv_start')
reserv_end = form.getvalue('reserv_end')
boat_country = form.getvalue('boat_country')
cni = form.getvalue('cni')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<style> h1 {font-family: sans-serif; text-align:center} h2 {font-family: sans-serif;text-align:center} h3 {font-family: sans-serif;} p {font-family: sans-serif;} table{width: 20%; margin: 0 auto; border-collapse:collapse; text-align:center;} td {font-family: sans-serif; padding:5px} th {font-family: sans-serif; padding:5px} tr:nth-child(even) {background-color: #f2f2f2;} </style>')
print('<title>SIBD Project</title>')
print('</head>')
print('<body>')

connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials)
    cursor = connection.cursor()

    # Making query
    sql = 'DELETE FROM trip \
           WHERE takeoff = %s  AND arrival = %s AND insurance = %s AND from_latitude = %s AND from_longitude = %s \
           AND to_latitude = %s AND to_longitude = %s AND skipper = %s AND reservation_start_date = %s AND \
           reservation_end_date = %s AND boat_country = %s  AND cni = %s ;'
    data=(takeoff,arrival,insurance,from_lat,from_long,to_lat,to_long,skipper,reserv_start,reserv_end,boat_country,cni)

    # Feed the data to the SQL query as follows to avoid SQL injection
    cursor.execute(sql, data)
    # Commit the update (without this step the database will not change)
    connection.commit()

    # Closing connection
    cursor.close()

    # Button Go Back
    print('<form action="trips.cgi" method="post">')
    print('<h1>Trip successfully removed.</h1>')
    print('<p style="text-align:center"><input type="submit" value="Go Back" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

# Case error    
except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print('<p style="text-align:center">{}</p>'.format(e))

    # Button Go Back
    print('<form action="trips.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Go Back" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

finally:
    if connection is not None:
        connection.close()

print('</body>')
print('</html>')