def say_x(x):
	print(x)

variable = input('what you want to print? ')

say_x(variable)


def sayname(first, last):
	"""This is a docstring, documentation for variable"""
	print('{} {}' .format(first, last))

sayname('luke', 'griffith')

sayname(last='griffith', first='luke')
 