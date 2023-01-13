#!/usr/bin/python3
import cgi
form = cgi.FieldStorage()
type = form.getvalue('type')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<style> h1 {font-family: sans-serif; text-align:center} h2 {font-family: sans-serif;text-align:center} h3 {font-family: sans-serif;} p {font-family: sans-serif;} table{width: 20%; margin: 0 auto; border-collapse:collapse; text-align:center;} td {font-family: sans-serif; padding:5px} th {font-family: sans-serif; padding:5px} tr:nth-child(even) {background-color: #f2f2f2;} </style>')
print('<title>SIBD Project</title>')
print('</head>')
print('<body>')

# Case sailor is a senior sailor
if int(type) == 0:
    print('<h1>Create new senior sailor</h1>')

# Case sailor is a junior sailor
elif int(type) == 1:
    print('<h1>Create new junior sailor</h1>')

# The form will send the info needed for the SQL query
print('<form action="updatesailor.cgi" method="post">')
print('<p><input type="hidden" name="type" value="{}"/></p>'.format(type))
print('<table>')
print('<tr><td>First Name:</td><td><p><input type="text" name="first_name"/></p></td></tr>')
print('<tr><td>Surname:</td><td><p><input type="text" name="surname"/></p></td></tr>')
print('<tr><td>Email:</td><td><p><input type="email" id="email" name="email"/></p></td></tr>')
print('</table>')
print('<p style="text-align:center"><input type="submit" value="Create" style = "font-size:14px; width:100px; height:30px"/></p>')
print('</form>')

# Button Cancel
print('<form action="sailor.cgi" method="post">')
print('<p style="text-align:center"><input type="submit" value="Cancel" style = "font-size:14px; width:100px; height:30px"/></p>')
print('</form>')
print('</body>')
print('</html>')