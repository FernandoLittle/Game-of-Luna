extends Node2D

@export var DragCardT: Sprite2D
@export var DragCoinT: Sprite2D

@export var DragCard: Node2D
@export var DragCoin: Node2D


@export var DataCard: CardData
@export var Dio: ControllerDio
@export var CardSelected: bool
@export var CardSelected1: bool

@export var CoinSelected: bool
@export var CoinSelected1: bool
@export var TempTexture: Texture

@export var SpriteSelected: Sprite2D
@export var AnimeController0: AnimeController


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	DragCard.position= get_local_mouse_position()
	DragCoin.position= get_local_mouse_position()
	
	if(Input.is_action_just_released("LeftMouse")):
		if(CardSelected==true && CardSelected1==true):
			SetSelectedCard()
			
		else:
			UndoSelectedCard()
			
			
			
			
			

		if(CoinSelected==false && CoinSelected1==true):
			print("Mensagem: coloque uma moeda correspondente ao custo")
		if(CoinSelected==true && CoinSelected1==true):
			VerifyCoin()
			UndoSelectedCoin()
			pass
		else:
			
			UndoSelectedCoin()
		
			
	pass
func VerifyCostCoinOk():

	
	if(Dio.CoinCostsTemp[0]==0&&Dio.CoinCostsTemp[1]==0&& Dio.CoinCostsTemp[2]==0):
		Dio.PlayCard.show()
func VerifyCoin():
	print("CoinId:")
	print(Dio.SelectedCoinId)
	var STOP: bool=false
	for x in range(0,3):
		if(Dio.SelectedCoinId== Dio.CoinCostsTemp[x] && STOP==false):
			Dio.CoinCostsTemp[x]=0
			STOP=true
			SetCoin(x)
		
		
		
	
	VerifyCostCoinOk()
	
	pass
func SetCoin(PositionCoin: int):
	if(Dio.SelectedCoinId==1):
		TempTexture=Dio.TextureCoinMoney
	if(Dio.SelectedCoinId==2):
		TempTexture=Dio.TextureCoinState
	if(Dio.SelectedCoinId==3):
		TempTexture=Dio.TextureCoinPeople
		
		
		
	if(PositionCoin==0):
		Dio.Coin1A.show()
		Dio.TextureCoin1A.texture= TempTexture
	if(PositionCoin==1):
		Dio.Coin2A.show()
		Dio.TextureCoin2A.texture= TempTexture
	if(PositionCoin==2):
		Dio.Coin3A.show()
		Dio.TextureCoin3A.texture= TempTexture
	pass
func UndoSelectedCoin():
	CoinSelected1=false
	DragCoin.hide()
	
	Dio.SelectedCoinId= 0
	
	Dio.Coin1.show()
	Dio.Coin2.show()
	Dio.Coin3.show()
		
func UndoSelectedCard():
	CardSelected1=false
	DragCard.hide()
	
	Dio.SelectedCardId= 0
	
	Dio.CardButton1.show()
	Dio.CardButton2.show()
	Dio.CardButton3.show()
func SetSpriteCoin():
	
	Dio.Coin1A.hide()
	Dio.Coin2A.hide()
	Dio.Coin3A.hide()
	Dio.Coin1B.hide()
	Dio.Coin2B.hide()
	Dio.Coin3B.hide()
	if(Dio.CoinCosts[0]!=0):
		Dio.Coin1B.show()	
		pass
	if(Dio.CoinCosts[1]!=0):
		Dio.Coin2B.show()	
		pass
	if(Dio.CoinCosts[2]!=0):
		Dio.Coin3B.show()	
		pass
		
	if(Dio.CoinCosts[0]==1):		
		Dio.TextureCoin1B.texture= Dio.TextureCoinMoney
		Dio.TextureCoin1A.texture= Dio.TextureCoinMoney
	if(Dio.CoinCosts[0]==2):
		Dio.TextureCoin1B.texture= Dio.TextureCoinState
		Dio.TextureCoin1A.texture= Dio.TextureCoinState
	if(Dio.CoinCosts[0]==3):
		Dio.TextureCoin1B.texture= Dio.TextureCoinPeople
		Dio.TextureCoin1A.texture= Dio.TextureCoinPeople
		
		
		
	if(Dio.CoinCosts[1]==1):		
		Dio.TextureCoin2B.texture= Dio.TextureCoinMoney
		Dio.TextureCoin2A.texture= Dio.TextureCoinMoney
	if(Dio.CoinCosts[1]==2):
		Dio.TextureCoin2B.texture= Dio.TextureCoinState
		Dio.TextureCoin2A.texture= Dio.TextureCoinState
	if(Dio.CoinCosts[1]==3):
		Dio.TextureCoin2B.texture= Dio.TextureCoinPeople
		Dio.TextureCoin2A.texture= Dio.TextureCoinPeople
		
		
	if(Dio.CoinCosts[2]==1):		
		Dio.TextureCoin3B.texture= Dio.TextureCoinMoney
		Dio.TextureCoin3A.texture= Dio.TextureCoinMoney
	if(Dio.CoinCosts[2]==2):
		Dio.TextureCoin3B.texture= Dio.TextureCoinState
		Dio.TextureCoin3A.texture= Dio.TextureCoinState
	if(Dio.CoinCosts[2]==3):
		Dio.TextureCoin3B.texture= Dio.TextureCoinPeople
		Dio.TextureCoin3A.texture= Dio.TextureCoinPeople
	pass
func SetSelectedCard():
	
	AnimeController0.CloseCard()
	for x in range (0,3):	
		Dio.CoinCosts[x]=DataCard.Cards[Dio.SelectedCardId].CardCosts[x]
		Dio.CoinCostsTemp[x]=DataCard.Cards[Dio.SelectedCardId].CardCosts[x]
		pass
		
	SetSpriteCoin()
	
	
	
	
	SpriteSelected.texture=DataCard.Cards[Dio.SelectedCardId].CardIlustration
	DragCard.hide()
	Dio.NoPlayCard.show()
	VerifyCostCoinOk()
	#Anime Cards Down
func DragarCard():
	
	
	DragCardT.texture = Dio.CardData0.Cards[Dio.AllyCards[Dio.SelectedCardId]].CardIlustration
	
	CardSelected1=true
	DragCard.show()	
	
	pass
func DragarCoin():
	if(Dio.SelectedCoinId==1):
		DragCoinT.texture= Dio.TextureCoinMoney
		pass
	if(Dio.SelectedCoinId==2):
		DragCoinT.texture= Dio.TextureCoinState
		pass
	if(Dio.SelectedCoinId==3):
		DragCoinT.texture= Dio.TextureCoinPeople
		pass
	
	
	
	CoinSelected1=true
	DragCoin.show()
	pass
func _on_texture_button_button_down():
	Dio.CardButton1.hide() #Change Number in other func
	Dio.SelectedCardId= Dio.AllyCards[0]#Change Index in other func
	DragarCard()
	pass # Replace with function body.


func _on_drag_sucess_control_mouse_entered():
	CardSelected=true
	pass # Replace with function body.


func _on_drag_sucess_control_mouse_exited():
	
	CardSelected=false
	pass # Replace with function body.


func _on_coin_1_button_down():
	
	Dio.Coin1.hide() #Change Number in other func
	Dio.SelectedCoinId= Dio.CoinsId[0]#Change Index in other func
	print("COINID")
	print(Dio.CoinsId[0])
	DragarCoin()
	pass # Replace with function body.


func _on_drag_sucess_coin_mouse_entered():
	CoinSelected=true
	pass # Replace with function body.


func _on_drag_sucess_coin_mouse_exited():
	CoinSelected=false
	pass # Replace with function body.


func _on_coin_2_button_down():
	Dio.Coin2.hide() #Change Number in other func
	Dio.SelectedCoinId= Dio.CoinsId[1]#Change Index in other func
	print("COINID")
	print(Dio.CoinsId[0])
	DragarCoin()
	pass # Replace with function body.


func _on_coin_3_button_down():
	Dio.Coin3.hide() #Change Number in other func
	Dio.SelectedCoinId= Dio.CoinsId[2]#Change Index in other func
	print("COINID")
	print(Dio.CoinsId[0])
	DragarCoin()
	pass # Replace with function body.


func _on_true_card_2_button_down():
	Dio.CardButton2.hide() #Change Number in other func
	Dio.SelectedCardId= Dio.AllyCards[1]#Change Index in other func
	DragarCard()
	pass # Replace with function body.


func _on_true_card_3_button_down():
	Dio.CardButton3.hide() #Change Number in other func
	Dio.SelectedCardId= Dio.AllyCards[2]#Change Index in other func
	DragarCard()
	pass # Replace with function body.
