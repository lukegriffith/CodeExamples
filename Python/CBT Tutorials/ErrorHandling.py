while True:
	try:
		print("Let us solve the equation (x/2) / (x-y) ")
		print("Please enter 0 to Exit")

		x = int(input("Please enter x: "))
		y = int(input("Please enter y: "))

		if x==0  or y==0: 
			break

		z = (x/2) / (x-y)

	except ZeroDivisionError as e: 
		print("There was an error with the code")
		print("You tried to divide by zero!")
	except NameError as e:
		print("There was an error with the code")
		print("You keyed in a text input when it expected a ")
	except Exception as e:
		print("There was an error with the code")
		print("Error: ", str(e))
	else:
		print("Solving (x/2) / (x-y) for values x = ", x," and y = ",y, "we get the result", z)
	