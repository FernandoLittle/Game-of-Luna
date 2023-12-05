extends Node
@export var Dio: ControllerDio
@export var ok: bool

func Effects(id: int):
	if(id==1):
		if(Dio.Money<0):
			ok=true
			print("You Lose")
		pass
	if(id==2):
		ok=true
		print("Gain 10 economy for each permanent")
		pass
	if(id==3):
		ok==true
		if(Dio.Money<30):
			UpAttribute(3,20)
		if(Dio.Money>30):
			UpAttribute(3,-20)
		pass
	if(id==4):
		if(Dio.People>50 && Dio.State<-50):
			ok==true
			print("You Win")
		pass
func UpAttribute(IdAttribute: int, Value:int):
	if(IdAttribute==1):
		Dio.Money+=Value
	if(IdAttribute==2):
		Dio.People+=Value
	if(IdAttribute==3):
		Dio.State+=Value
	
	pass
