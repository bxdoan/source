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
b.say_hello

c(bxd_server).
rr(bxd_server).
{ok, Pid} = bxd_server:start_link().
Pid ! <<"Test handle_info">>.
Cat = bxd_server:order_cat(Pid, "Cat Doan", white, "not actually a cat").
bxd_server:return_cat(Pid, Cat).
bxd_server:order_cat(Pid, "Cat Bui", black, "actually a cat").
bxd_server:order_cat(Pid, "Cat Bui", black, "actually a cat").
bxd_server:return_cat(Pid, Cat).
bxd_server:close_shop(Pid).