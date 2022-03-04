import json

x =  '{ "name":"John", "age":30, "city":"New York"}'

#parse x
#x = r'{"name": "John","age": 30, "married": True,"divorced": False,"children": ("Ann","Billy"), "pets": None,"cars": [{"model": "BMW 230", "mpg": 27.5}, {"model": "Ford Edge", "mpg": 24.1}]}'

#data = json.loads(x)


#convert python object to json
data = json.loads(x)
print(data)