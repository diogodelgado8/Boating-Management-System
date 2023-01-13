#!/usr/bin/python3
import psycopg2
import login
print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<style> h1 {font-family: sans-serif; text-align:center} h2 {font-family: sans-serif;text-align:center} h3 {font-family: sans-serif;} p {font-family: sans-serif;} table{width:100%; margin: 0 auto; border-collapse:collapse; text-align:center; border:1px solid black} td {font-family: sans-serif; border-right: 1px solid black; padding:5px} th {font-family: sans-serif; border-right: 1px solid black; padding:5px} tr:nth-child(even) {background-color: #f2f2f2;} </style>')
print('<title>SIBD Project</title>')
print('</head>')
print('<body>')
connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials)
    
    cursor = connection.cursor()

    # Making query trips
    sql = 'SELECT * FROM trip ORDER BY (cni, takeoff);'
    
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    
    # Displaying results
    print('<form action="initialpage.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Home Page" style = "font-size:14px; width:100px; height:30px"/></p>')  
    print('</form>')
    print('<h1>List of trips</h1>')
    print('<table>')
    print('<tr><th>Takeoff Date</th><th>Arrival Date</th><th>Insurance</th><th>From (lat)</th><th>From (long)</th><th>To (lat)</th><th>To (long)</th><th>Skipper Email</th><th>Reservation Start Date</th><th>Reservation End Date</th><th>Boat Country</th><th>CNI</th></tr>')
    for row in result:
        print('<tr>')
        for value in row:
            print('<td>{}</td>'.format(value))
        
        # Buttons Remove Trip
        print('<form action="removetrip.cgi" method="post">')
        print('<p><input type="hidden" name="takeoff" value="{}"/></p>'.format(row[0]))
        print('<p><input type="hidden" name="arrival" value="{}"/></p>'.format(row[1]))
        print('<p><input type="hidden" name="insurance" value="{}"/></p>'.format(row[2]))
        print('<p><input type="hidden" name="from_lat" value="{}"/></p>'.format(row[3]))
        print('<p><input type="hidden" name="from_long" value="{}"/></p>'.format(row[4]))
        print('<p><input type="hidden" name="to_lat" value="{}"/></p>'.format(row[5]))
        print('<p><input type="hidden" name="to_long" value="{}"/></p>'.format(row[6]))
        print('<p><input type="hidden" name="skipper" value="{}"/></p>'.format(row[7]))
        print('<p><input type="hidden" name="reserv_start" value="{}"/></p>'.format(row[8]))
        print('<p><input type="hidden" name="reserv_end" value="{}"/></p>'.format(row[9]))
        print('<p><input type="hidden" name="boat_country" value="{}"/></p>'.format(row[10]))
        print('<p><input type="hidden" name="cni" value="{}"/></p>'.format(row[11]))
        print('<td><p><input type="submit" value="Remove Trip"/></p></td>')  
        print('</form>')
    print('</tr>')
    print('</table>')
    
    # Button Register New Trip 
    print('<form action="createtrip.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Register New Trip" style = "font-size:14px; height:30px"/></p>')  
    print('</form>')

    #Closing connection
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