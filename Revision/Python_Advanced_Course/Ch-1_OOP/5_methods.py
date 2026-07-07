class MyClass:

    my_var = 100

    # Dunder method or magic method
    def __init__(self):
        print("This is the constructor method")

    # Dunder method for str 
    def __str__(self):
        return "This is the string representation of the object"

    @classmethod
    def _change_value(cls,new_value):  #Here cls is a reference to the class itself and not the object. So we can use cls to access the class variables and methods. We can also use cls to create new objects of the class. We can also use cls to call other class methods. We can also use cls to call static methods. We can also use cls to call dunder methods. We can also use cls to call other classes. We can also use cls to call other modules. We can also use cls to call other packages. We can also use cls to call other libraries. We can also use cls to call other frameworks. We can also use cls to call other languages. We can also use cls to call other platforms. We can also use cls to call other operating systems. We can also use cls to call other devices. We can also use cls to call other networks. We can also use cls to call other protocols. We can also use cls to call other standards. We can also use cls to call other specifications. We can also use cls to call other architectures. We can also use cls to call other paradigms. We can also use cls to call other methodologies. We can also use cls to call other techniques. We can also use cls to call other tools. We can also use cls to call other utilities. We can also use cls to call other applications. We can also use cls to call other services. We can also use cls to call other APIs.
        cls.my_var = new_value

    @staticmethod
    def dummy():
        print("This is a dummy method")

obj = MyClass()
print(obj.my_var) # 100
obj._change_value(200)
print(obj.my_var) # 200
obj2 = MyClass()
print(obj2.my_var) # 200
obj3 = MyClass()
print(obj3.dummy()) #none
obj4 = MyClass()
print(obj4)