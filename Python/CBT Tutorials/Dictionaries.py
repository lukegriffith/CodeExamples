ages = {"Luke":23,"Jess":20,"Mark":47,"Caroline":47}

print(ages)

for age in ages:
	print('The age of',age,'is',ages[age])

###This has to be done with dictionaries, as it doesn't have an order. You can get the value by specifying ages - the collection and [age] the key to get the value

#.keys() is a function to get a list of keys. this is useful - this does not work in py3 
x = ages.keys()
print(x)

#Adding new keys to a dictionary is the same as lists, but to delete you need to use del ages[remKey]

