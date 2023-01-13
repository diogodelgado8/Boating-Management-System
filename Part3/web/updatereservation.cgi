#!/usr/bin/python3
import psycopg2, cgi
import login

form = cgi.FieldStorage()
start_date = form.getvalue('start_date')
end_date = form.getvalue('end_date')
country = form.getvalue('country')
cni = form.getvalue('cni')
responsible = form.getvalue('responsible')

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
    sql= 'INSERT INTO reservation(cni, start_date, end_date, country, responsible)\
                VALUES(%(cni)s, %(start_date)s, %(end_date)s, %(country)s, %(responsible)s);'

    data=({'cni': cni, 'start_date': start_date, 'end_date': end_date, 'country': country, 'responsible': responsible})

    # Feed the data to the SQL query as follows to avoid SQL injection
    cursor.execute(sql, data)
    # Commit the update (without this step the database will not change)
    connection.commit()

    # Closing connection
    cursor.close()

    # Button Go Back
    print('<form action="reservation.cgi" method="post">')
    print('<h1>Reservation successfully created.</h1>')
    print('<p style="text-align:center"><input type="submit" value="Go Back" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

# Case error    
except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print('<p style="text-align:center">{}</p>'.format(e))

    # Button Go Back
    print('<form action="reservation.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Go Back" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

finally:
    if connection is not None:
        connection.close()

print('</body>')
print('</html>')