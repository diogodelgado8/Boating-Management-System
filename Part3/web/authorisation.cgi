#!/usr/bin/python3
import psycopg2
import login
print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<style> h1 {font-family: sans-serif; text-align:center} h2 {font-family: sans-serif;text-align:center} h3 {font-family: sans-serif;} p {font-family: sans-serif;} table{width:90%; margin: 0 auto; border-collapse:collapse; text-align:center; border:1px solid black} td {font-family: sans-serif; border-right: 1px solid black; padding:5px} th {font-family: sans-serif; border-right: 1px solid black; padding:5px} tr:nth-child(even) {background-color: #f2f2f2;} </style>')
print('<title>SIBD Project</title>')
print('</head>')
print('<body>')
connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials)
    cursor = connection.cursor()

    # Making query authorisations
    sql = 'SELECT * FROM authorised ORDER BY (start_date, end_date, boat_country, cni, sailor);'
    
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    
    # Displaying results
    print('<form action="initialpage.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Home Page" style = "font-size:14px; width:100px; height:30px"/></p>')  
    print('</form>')
    print('<h1>List of authorisations</h1>')
    print('<table>')
    print('<tr><th>Start Date</th><th>End Date</th><th>Boat Country</th><th>CNI</th><th>Sailor Email</th></tr>')
    for row in result:
        print('<tr>')
        for value in row:
            print('<td style="width:500">{}</td>'.format(value))
        
        # Buttons De-authorise Sailor
        print('<form action="removeauthorisation.cgi" method="post">')
        print('<p><input type="hidden" name="start" value="{}"/></p>'.format(row[0]))
        print('<p><input type="hidden" name="end" value="{}"/></p>'.format(row[1]))
        print('<p><input type="hidden" name="country" value="{}"/></p>'.format(row[2]))
        print('<p><input type="hidden" name="cni" value="{}"/></p>'.format(row[3]))
        print('<p><input type="hidden" name="sailor" value="{}"/></p>'.format(row[4]))
        print('<td><p><input type="submit" value="De-authorise Sailor"/></p></td>')  
        print('</form>')
        print('</tr>')
    print('</table>')
    
    # Button Create Authorisation
    print('<form action="createauthorisation.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Authorise sailor for reservation" style = "font-size:14px; height:30px"/></p>')  
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