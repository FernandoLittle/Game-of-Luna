extends Node
class_name ControllerDio




@export var AnimeController0: AnimeController
@export var DataCard: CardData

@export var Money: int
@export var People: int
@export var State: int







@export var SelectedCardId: int

@export var CoinsId=[0,0,0]









@export var PlayCard: Node
@export var NoPlayCard: Node


#Cards
@export var CardSprite1: TextureButton
@export var CardSprite2: TextureButton
@export var CardSprite3: TextureButton

@export var CardButton1: Node
@export var CardButton2: Node
@export var CardButton3: Node


#Drag Coins
@export var Coin1: Node
@export var Coin2: Node
@export var Coin3: Node
@export var TextureCoinMoney: Texture
@export var TextureCoinState: Texture
@export var TextureCoinPeople: Texture
@export var TextureCoin1: Sprite2D
@export var TextureCoin2: Sprite2D
@export var TextureCoin3: Sprite2D

#CostCoin Active
@export var Coin1A: Node
@export var Coin2A: Node
@export var Coin3A: Node
@export var TextureCoin1A: Sprite2D
@export var TextureCoin2A: Sprite2D
@export var TextureCoin3A: Sprite2D

#CostCoin Deactive
@export var Coin1B: Node
@export var Coin2B: Node
@export var Coin3B: Node
@export var TextureCoin1B: Sprite2D
@export var TextureCoin2B: Sprite2D
@export var TextureCoin3B: Sprite2D

#Eye
@export var EyeSprite: Sprite2D
@export var EyeName: Label

@export var EyeRequirement: Label
@export var EyeEffect: Label
@export var EyeMoney: Label
@export var EyePeople: Label
@export var EyeGovernment: Label








@export var SelectedCoinId: int
#@export var CoinId =[1,2,3]
@export var CardData0: CardData







@export var AllyCards =[1,1,2,3,4,5,6]

@export var CoinCosts = [0,0,0]
@export var CoinCostsTemp =[0,0,0]



func SetInfoCards():
	CardSprite1.texture_normal = CardData0.Cards[AllyCards[0]].CardIlustration
	CardSprite2.texture_normal = CardData0.Cards[AllyCards[1]].CardIlustration
	CardSprite3.texture_normal = CardData0.Cards[AllyCards[2]].CardIlustration
	pass

func SetEye(Id:int):
	AnimeController0.OpenEye()
	EyeSprite.texture= CardData0.Cards[AllyCards[Id]].CardIlustration
	EyeName.text=CardData0.Cards[AllyCards[Id]].CardName
	EyeRequirement.text= "[Requirement] "+ CardData0.Cards[AllyCards[Id]].CardRequirement
	EyeEffect.text= "[Effect] "+ CardData0.Cards[AllyCards[Id]].CardEffect
	EyeMoney.text=str(CardData0.Cards[AllyCards[Id]].EconomicAttribute)
	EyePeople.text=str(CardData0.Cards[AllyCards[Id]].PopulationAttribute)
	EyeGovernment.text=str(CardData0.Cards[AllyCards[Id]].GovernmentAttribute)
	pass
func SetEyeFromButton(IdZone: int):

	SetEye(AllyCards[IdZone])
	pass


func _on_true_card_1_mouse_entered():
	SetEyeFromButton(0)
	pass # Replace with function body.


func _on_true_card_2_mouse_entered():
	SetEyeFromButton(1)
	pass # Replace with function body.


func _on_true_card_3_mouse_entered():
	SetEyeFromButton(2)
	pass # Replace with function body.
