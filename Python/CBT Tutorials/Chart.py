x = range(0,99,10)

numOne = 1
numTwo = 10

for num in x:



	a = range(numOne,numTwo)

	print(num, "\t", end="")

	for num in a:
		print(num, "\t",end="")

	print("")

	numOne = numOne + 10
	numTwo = numTwo + 10


