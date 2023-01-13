#!/usr/bin/python3
import cgi

form = cgi.FieldStorage()

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<style> h1 {font-family: sans-serif; text-align:center} h2 {font-family: sans-serif;text-align:center} h3 {font-family: sans-serif;} p {font-family: sans-serif;} table{width: 20%; margin: 0 auto; border-collapse:collapse; text-align:center;} td {font-family: sans-serif; padding:5px;} th {font-family: sans-serif; padding:5px} tr:nth-child(even) {background-color: #f2f2f2;} </style>')
print('<title>SIBD Project</title>')
print('</head>')
print('<body>')

# Title
print('<h1 style="color:blue">SIBD Project - Group 06</h1>')
print('<h1> Boating Management System</h1>')
print('<h1> Home Page</h1>')
print('<h2>What would you like to do?</h2>')

# Buttons with options
print('<table>')
# List, create and remove sailors
print('<form action="sailor.cgi" method="post">')
print('<tr><td><p><input type="submit" value="List, create and remove sailors" style = "font-size:20px; width:500px; height:50px"/></p></td></tr>') 
print('</form>')
# List, create and remove reservations
print('<form action="reservation.cgi" method="post">')
print('<tr><td><p><input type="submit" value="List, create and remove reservations" style = "font-size:20px; width:500px; height:50px"/></p></td></tr>') 
print('</form>')
# Authorise/De-authorise sailors for reservations
print('<form action="authorisation.cgi" method="post">')
print('<tr><td><p><input type="submit" value="Authorise/De-authorise sailors for reservations" style = "font-size:20px; width:500px; height:50px"/></p></td></tr>') 
print('</form>')
# List, register and remove trips
print('<form action="trips.cgi" method="post">')
print('<tr><td><p><input type="submit" value="List, register and remove trips" style = "font-size:20px; width:500px; height:50px"/></p></td></tr>') 
print('</form>')
print('</table>')

print('</body>')
print('</html>')