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

    # Making query reservations
    sql = 'SELECT start_date, end_date, country, cni FROM reservation;'
    
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    
    # Displaying results
    print('<h1>List of reservations available</h1>')
    print('<table style="width:90%; margin: 0 auto; border:1px solid black">')
    print('<tr><th>Start Date</th><th>End Date</th><th>Boat Country</th><th>CNI</th></tr>')
    for row in result:
        print('<tr>')
        for value in row:
            print('<td style="width:500; border-right: 1px solid black">{}</td>'.format(value))
        print('</tr>')
    print('</table>')

    # The form will send the info needed for the SQL query
    print('<h3>Please insert the information about the reservation and the authorised sailor</h3>')
    print('<form action="updateauthorisation.cgi" method="post">')
    print('<table style="width:20%; margin: 0 auto">')
    print('<tr><td>Start Date:</td><td><p><input type="date" name="start"/></p></td></tr>')
    print('<tr><td>End Date:</td><td><p><input type="date" name="end"/></p></td></tr>')
    print('<tr><td>Boat Country:</td><td><p><input type="text" name="country"/></p></td></tr>')
    print('<tr><td>CNI:</td><td><p><input type="text" name="cni"/></p></td></tr>')
    print('<tr><td>Sailor Email:</td><td><p><input type="email" id="email" name="email"/></p></td></tr>')
    print('</table>')
    print('<p style="text-align:center"><input type="submit" value="Authorise" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

    # Button Cancel
    print('<form action="authorisation.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Cancel" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

    #Closing connection
    cursor.close()
    
# Case error
except Exception as e:
    print('<h1>An error occurred.</h1>')
    print('<p style="text-align:center">{}</p>'.format(e))

    # Button Go Back
    print('<form action="authorisation.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Go Back" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

finally:
    if connection is not None:
        connection.close()
        
print('</body>')
print('</html>')