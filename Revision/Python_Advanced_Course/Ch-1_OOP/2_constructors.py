class MyClass:

    # Class variables
    var1 = "Abhay"
    var2 = "Pandey"

    # Instance Variables
    def __init__(self,dyn1,dyn2,dyn3):
        self.dyn1 = dyn1 
        self.dyn2 = dyn2
        self.dyn3 = dyn3

    def func1(self):
        print(f"Hello World, {self.dyn1}")

    def func2(self):
        print(f"Hello Globe, {self.dyn2}")

    def func3(self):
        print(f"Hello Globe, {self.dyn3}")


obj = MyClass("abc","def","xyz")
obj.func2()

# Another Way to call the function without creating an object of the class. We can call the function by using the class name and passing the object as an argument to the function.
MyClass.func2(obj)

