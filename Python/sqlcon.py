import _mysql
import sys

try: 
	con = _mysql.connect('localhost', 'root','', 'lukegriffith')
	con.query("select * from blog_blogposts")
	result = con.use_result()

	for x in result.fetch_row():
		print(x)

finally:
    
	if con:
		con.close()