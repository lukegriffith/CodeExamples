name = input('Please tell me your name: ')
rawAge = input('Please tell me your age: ')
age = int(rawAge)

if age >= 20: 
	print(name, 'you are older than 20 years old!')
elif age >= 18:
	print('your allowed in')
	print('but you cant drink')
else:
	print('Get out!!', name, 'You are not older than 20')
