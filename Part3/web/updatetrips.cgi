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
    sql= 'INSERT INTO trip(boat_country, takeoff, cni, reservation_start_date, reservation_end_date, \
                        arrival, insurance, from_latitude, from_longitude, to_latitude, to_longitude, skipper)\
                    VALUES\
                        (%(country)s, %(takeoff)s, %(cni)s, %(reserv_start)s, %(reserv_end)s,\
                        %(arrival)s, %(insurance)s, %(from_lat)s, %(from_long)s, %(to_lat)s, %(to_long)s, %(skipper)s);'

    data=({'country': boat_country, 'takeoff': takeoff, 'cni': cni, 'reserv_start': reserv_start, 'reserv_end': reserv_end,'arrival': arrival, 'insurance': insurance, 'from_lat': from_lat, 'from_long': from_long, 'to_lat': to_lat, 'to_long': to_long, 'skipper': skipper})
    
    cursor.execute(sql, data)
    # Commit the update (without this step the database will not change)
    connection.commit()

    # Closing connection
    cursor.close()

    # Button Go Back
    print('<form action="trips.cgi" method="post">')
    print('<h1>Trip successfully registered.</h1>')
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