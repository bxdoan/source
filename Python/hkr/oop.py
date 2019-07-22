class Animal:
	def __init__(self):
		pass
	def say_hello(self):
		print("hello")

class Dog(Animal):
	def __init__(self):
		Animal.__init__(self)
	def say_hello(self):
		print("gau gau")

class Cat(Animal):
	def __init__(self):
		Animal.__init__(self)
	def say_hello(self):
		print("meow meow")


a = Animal()
a.say_hello()

b = Dog()
b.say_hello()

b = Cat()
b.say_hello()