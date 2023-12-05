extends Node

@export var Dio: ControllerDio










@export var DicesInt = [0,0,0]
@export var Dice1T: Label
@export var Dice2T: Label
@export var Dice3T: Label
@export var ControllerDio: Node
func RollDice():
	for x in range(0, 3):
		Dio.CoinsId[x] = randi_range(1,3)
		
		
		
	if(Dio.CoinsId[0]==1):		
		Dio.TextureCoin1.texture= Dio.TextureCoinMoney
	if(Dio.CoinsId[0]==2):		
		Dio.TextureCoin1.texture= Dio.TextureCoinState
	if(Dio.CoinsId[0]==3):		
		Dio.TextureCoin1.texture= Dio.TextureCoinPeople
		
		
		
		
	if(Dio.CoinsId[1]==1):		
		Dio.TextureCoin2.texture= Dio.TextureCoinMoney
	if(Dio.CoinsId[1]==2):		
		Dio.TextureCoin2.texture= Dio.TextureCoinState
	if(Dio.CoinsId[1]==3):		
		Dio.TextureCoin2.texture= Dio.TextureCoinPeople
		
		
	if(Dio.CoinsId[2]==1):		
		Dio.TextureCoin3.texture= Dio.TextureCoinMoney
	if(Dio.CoinsId[2]==2):		
		Dio.TextureCoin3.texture= Dio.TextureCoinState
	if(Dio.CoinsId[2]==3):		
		Dio.TextureCoin3.texture= Dio.TextureCoinPeople

	
	

func _on_dice_button_pressed():
	RollDice()


func ActiveDices():
	for x in range(0, 3):
		pass
	pass
