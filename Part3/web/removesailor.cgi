#!/usr/bin/python3
import psycopg2, cgi
import login

form = cgi.FieldStorage()
email = form.getvalue('email')

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
    sql = ' START TRANSACTION;\
            SET CONSTRAINTS ALL DEFERRED;\
            DELETE FROM trip\
            WHERE skipper=%s\
            OR (reservation_start_date IN (SELECT r.start_date\
                                            FROM reservation r\
                                            WHERE responsible=%s)\
                AND reservation_end_date IN (SELECT r.end_date\
                                            FROM reservation r\
                                            WHERE responsible=%s)\
                AND boat_country IN (SELECT r.country\
                                    FROM reservation r\
                                    WHERE responsible=%s)\
                AND cni IN (SELECT r.cni\
                            FROM reservation r\
                            WHERE responsible=%s));\
            DELETE FROM authorised a\
            WHERE start_date IN (SELECT r.start_date\
                                FROM reservation r\
                                WHERE responsible=%s)\
                AND end_date IN (SELECT r.end_date\
                                FROM reservation r\
                                WHERE responsible=%s)\
                AND boat_country IN (SELECT r.country\
                                FROM reservation r\
                                WHERE responsible=%s)\
                AND cni IN (SELECT r.cni\
                                FROM reservation r\
                                WHERE responsible=%s);\
            DELETE FROM authorised a\
            WHERE a.sailor=%s;\
            DELETE FROM reservation\
            WHERE responsible=%s;\
            DELETE FROM valid_for\
            WHERE sailor=%s;\
            DELETE FROM sailing_certificate\
            WHERE sailor=%s;\
            DELETE FROM senior\
            WHERE email=%s;\
            DELETE FROM junior\
            WHERE email=%s;\
            DELETE FROM sailor\
            WHERE email=%s;\
            COMMIT;'
            
    data=(email,email,email,email,email,email,email,email,email,email,email,email,email,email,email,email)

    # Feed the data to the SQL query as follows to avoid SQL injection
    cursor.execute(sql, data)
    # Commit the update (without this step the database will not change)
    connection.commit()

    # Closing connection
    cursor.close()

    # Button Go Back
    print('<form action="sailor.cgi" method="post">')
    print('<h1>Sailor successfully removed.</h1>')
    print('<p style="text-align:center"><input type="submit" value="Go Back" style = "font-size:14px; width:100px; height:30px"/></p>')
    print('</form>')

# Case error 
except Exception as e:
    # Print errors on the webpage if they occur
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