import math

class Shape(object):   # Putting (object) enables superclass refferal 
	def __init__(self):
		self.colour = "Red"
		self.sides = 0

	def calcArea(self):
		return 0

class Quadrilateral(Shape):
	def __init__(self, w, l, c):
		self.sides = 4
		self.width = w
		self.length = l
		self.colour = c

	def calcArea(self):
		return self.width * self.length

class Square(Quadrilateral):
	def __init__(self, w, c):
		super(Square, self).__init__(w,w,c)
		
#Calling super, intiates the super class 

sq1 = Square(4, "Blue")

print(sq1.width)

