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

    # Making query sailor
    sql = 'SELECT * FROM sailor ORDER BY firstname;'
    
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    
    # Displaying results
    print('<form action="initialpage.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Home Page" style = "font-size:14px; width:100px; height:30px"/></p>')  
    print('</form>')
    print('<h1>List of all sailors (juniors and seniors)</h1>')
    print('<table>')
    print('<tr><th>First Name</th><th>Surname</th><th>Email</th></tr>')
    for row in result:
        print('<tr>')
        for value in row:
            print('<td style="width:500">{}</td>'.format(value))
        
        # Buttons Remove Sailor
        print('<form action="removesailor.cgi" method="post">')
        print('<p><input type="hidden" name="email" value="{}"/></p>'.format(row[2]))
        print('<td><p><input type="submit" value="Remove Sailor"/></p></td>')  
        print('</form>')
        print('</tr>')
    print('</table>')
    
    # Making query junior
    sql = 'SELECT firstname, surname, email FROM sailor s NATURAL JOIN junior j;'
    
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    
    # Displaying results
    print('<h2>List of junior sailors</h2>')
    print('<table>')
    print('<tr><th>First Name</th><th>Surname</th><th>Email</th></tr>')
    for row in result:
        print('<tr>')
        for value in row:
            print('<td style="width:500">{}</td>'.format(value))
        
        # Buttons Remove Sailor
        print('<form action="removesailor.cgi" method="post">')
        print('<p><input type="hidden" name="email" value="{}"/></p>'.format(row[2]))
        print('<td><p><input type="submit" value="Remove Sailor"/></p></td>')  
        print('</form>')
        print('</tr>')
    print('</table>')
    
    # Button Create Junior Sailor
    print('<form action="createsailor.cgi" method="post">')
    print('<p><input type="hidden" name="type" value="{}"/></p>'.format(1))   # flag 1 = junior
    print('<p style="text-align:center"><input type="submit" value="Create Junior Sailor" style = "font-size:14px; height:30px"/></p>')  
    print('</form>')


    # Making query senior
    sql = 'SELECT firstname, surname, email FROM sailor s NATURAL JOIN senior s2;'
    
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    
    # Displaying results
    print('<h2>List of senior sailors</h2>')
    print('<table>')
    print('<tr><th>First Name</th><th>Surname</th><th>Email</th></tr>')
    for row in result:
        print('<tr>')
        for value in row:
            print('<td style="width:500">{}</td>'.format(value))
        
        # Buttons Remove Sailor
        print('<form action="removesailor.cgi" method="post">')
        print('<p><input type="hidden" name="email" value="{}"/></p>'.format(row[2]))
        print('<td><p><input type="submit" value="Remove Sailor"/></p></td>')  
        print('</form>')
        print('</tr>')
    print('</table>')
    
    # Button Create Senior Sailor
    print('<form action="createsailor.cgi" method="post">')
    print('<p><input type="hidden" name="type" value="{}"/></p>'.format(0))  # flag 0 = senior 
    print('<p style="text-align:center"><input type="submit" value="Create Senior Sailor" style = "font-size:14px; height:30px"/></p>')  
    print('</form>')

    #Closing connection
    cursor.close()

# Case error  
except Exception as e:
    print('<h1>An error occurred.</h1>')
    print('<p style="text-align:center">{}</p>'.format(e))

    # Button Go Back
    print('<form action="sailor.cgi" method="post">')
    print('<p style="text-align:center"><input type="submit" value="Go Back" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')
    
finally:
    if connection is not None:
        connection.close()
        
print('</body>')
print('</html>')