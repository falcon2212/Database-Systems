from random import *
numbers = ["AP021234","AP031234","AP041234","AP051234","AP061234","AP071234"]
ids = [1,2,3,4,5,6]
vehicleType = ["Car","Bus","Truck","Van"]
tollTime = ["12:30","15:30","8:30","21:30","23:30"] 
tollType = ["one-way","two-way"]
for i in range(10):
	print ids[randint(1,1000)%6],numbers[randint(1,1000)%6],vehicleType[randint(1,1000)%4],randint(1,1000)%2,tollType[randint(1,1000)%2],tollTime[randint(1,1000)%5],randint(1,1000)%2