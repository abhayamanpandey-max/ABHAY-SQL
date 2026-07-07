import pandas as pd

class DataExt:

    def __init__(self,file_path:str):
        self.file_path = file_path

    def fetch_text(self,separator:str):
        # Write your custom logic
        df = pd.read_csv(self.file_path, sep=separator)
        print(df.head())

    def fetch_json(self):
        # Write your custom logic
        df = pd.read_json(self.file_path)
        print(df.head())

    def fetch_parquet(self):
        # Write your custom logic
        df = pd.read_parquet(self.file_path)   
        print(df.head()) 

print("\n")
print("This is the DataExt class which is used to fetch data from the text csv file.")
obj = DataExt("C:\\Abhay Folder\\ABHAY SQL\\Revision\\Python_Advanced_Course\\Ch-1_OOP\\Files\\orders.csv")
obj.fetch_text(",")

print("\n")
print("This is the DataExt class which is used to fetch data from json files.")
obj = DataExt("C:\\Abhay Folder\\ABHAY SQL\\Revision\\Python_Advanced_Course\\Ch-1_OOP\\Files\\orders.json")
obj.fetch_json()

print("\n")
print("This is the DataExt class which is used to fetch data from the text file.")
obj = DataExt("C:\\Abhay Folder\\ABHAY SQL\\Revision\\Python_Advanced_Course\\Ch-1_OOP\\Files\\orders.tsv")
obj.fetch_text("\t")

print("\n")
print("This is the DataExt class which is used to fetch data from the parquet file.")
obj = DataExt("C:\\Abhay Folder\\ABHAY SQL\\Revision\\Python_Advanced_Course\\Ch-1_OOP\\Files\\orders.parquet")
obj.fetch_parquet()
