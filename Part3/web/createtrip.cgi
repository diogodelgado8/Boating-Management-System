#!/usr/bin/python3
import psycopg2
import login
import cgi
form = cgi.FieldStorage()

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<style> h1 {font-family: sans-serif; text-align:center} h2 {font-family: sans-serif;text-align:center} h3 {font-family: sans-serif;text-align:center;} p {font-family: sans-serif;} table{border-collapse:collapse; text-align:center;} td {font-family: sans-serif; padding:5px} th {font-family: sans-serif; border-right: 1px solid black; padding:5px} tr:nth-child(even) {background-color: #f2f2f2;} </style>')
print('<title>SIBD Project</title>')
print('</head>')
print('<body>')

connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials)
    cursor = connection.cursor()

    # Making query locations
    sql = 'SELECT name, country_name, latitude, longitude FROM location;'

    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    
    # Displaying results
    print('<h1>List of locations available</h1>')
    print('<table style="width:90%; margin: 0 auto; border:1px solid black">')
    print('<tr><th>Name</th><th>Country</th><th>Latitude</th><th>Longitude</th></tr>')
    for row in result:
        print('<tr>')
        for value in row:
            print('<td style="width:500; border-right: 1px solid black">{}</td>'.format(value))
        print('</tr>')
    print('</table>')
    
    # The form will send the info needed for the SQL query
    print('<h3>Please insert the information about the trip you want to register</h3>')
    print('<form action="updatetrips.cgi" method="post">')
    print('<table style="width:40%; margin: 0 auto">')
    print('<tr><td>Takeoff:</td><td><p><input type="date" name="takeoff"/></p></td><td>Arrival:</td><td><p><input type="date" name="arrival"/></p></td></tr>')
    print('<tr><td>From (lat):</td><td><p><input type="text" name="from_lat"/></p></td><td>From (long):</td><td><p><input type="text" name="from_long"/></p></td></tr>')
    print('<tr><td>To (lat):</td><td><p><input type="text" name="to_lat"/></p></td><td>To (long):</td><td><p><input type="text" name="to_long"/></p></td></tr>')
    print('<tr><td>Insurance:</td><td><p><input type="text" name="insurance"/></p></td><td>Skipper Email:</td><td><p><input type="text" name="skipper"/></p></td></tr>')
    print('<tr><td>Reservation Start Date:</td><td><p><input type="date" name="reserv_start"/></p></td><td>Reservation End Date:</td><td><p><input type="date" name="reserv_end"/></p></td></tr>')
    print('<tr><td>Boat Country:</td><td><p><input type="text" name="boat_country"/></p></td><td>CNI:</td><td><p><input type="text" name="cni"/></p></td></tr>')
    print('</table>')
    print('<p style="text-align:center"><input type="submit" value="Register" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

    # Button Cancel
    print('<form action="trips.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Cancel" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

    # Closing connection
    cursor.close()

# Case error
except Exception as e:
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