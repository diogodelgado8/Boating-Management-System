#!/usr/bin/python3
import cgi
form = cgi.FieldStorage()

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<style> h1 {font-family: sans-serif; text-align:center} h2 {font-family: sans-serif;text-align:center} h3 {font-family: sans-serif;} p {font-family: sans-serif;} table{width: 20%; margin: 0 auto; border-collapse:collapse; text-align:center;} td {font-family: sans-serif; padding:5px} th {font-family: sans-serif; padding:5px} tr:nth-child(even) {background-color: #f2f2f2;} </style>')
print('<title>SIBD Project</title>')
print('</head>')
print('<body>')

print('<h1>Create new reservation</h1>')

# The form will send the info needed for the SQL query
print('<form action="updatereservation.cgi" method="post">')
print('<table>')
print('<tr><td>Start Date:</td><td><p><input type="date" name="start_date"/></p></td></tr>')
print('<tr><td>End Date:</td><td><p><input type="date" name="end_date"/></p></td></tr>')
print('<tr><td>Country:</td><td><p><input type="text" name="country"/></p></td></tr>')
print('<tr><td>CNI:</td><td><p><input type="text" name="cni"/></p></td></tr>')
print('<tr><td>Responsible Email:</td><td><p><input type="email" id="email" name="responsible"/></p></td></tr>')
print('</table>')
print('<p style="text-align:center"><input type="submit" value="Create" style = "font-size:14px; width:100px; height:30px"/></p>')
print('</form>')

# Button Cancel
print('<form action="reservation.cgi" method="post">')
print('<p style="text-align:center"><input type="submit" value="Cancel" style = "font-size:14px; width:100px; height:30px"/></p>')
print('</form>')
print('</body>')
print('</html>')