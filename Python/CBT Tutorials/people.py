import random

class Person:
	#This defines the constructor 
	def __init__(self, age):
		if age == 0: 
			self.age = int(random.uniform(1,100))
		else:
			self.age = age
	#This defines a method
	def CalcAge(self):
		return self.age * 2

people = []

for i in range(0,10):
	p = Person(0)
	p.people = i
	people.append(p)


for p in people:
	print("Person ", p.people, " is ", p.age, " years old")