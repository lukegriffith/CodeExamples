animals = ['bear', 'cat', 'dog', 'lion']


lookup = input('What animal are you looking for?')

# This is outside the scope of the chatper I read, but the first entry in the list will return as a false item because 0 is false. Doh !

try:
	lookupResult = animals.index(lookup)
except:
	lookupResult = False

if lookupResult:
	print('We\'ve found {}' .format(lookup))
else:
	print('We cant find any {}' .format(lookup))
