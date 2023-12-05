extends Node
@export var TempCoinPeople: PackedScene
@export var TempCoinMoney: PackedScene
@export var TempCoinState: PackedScene
@export var TempCoin: PackedScene

@export var Father1: Node2D
@export var Father2: Node2D
@export var Father3: Node2D
@export var Father: Node2D
@export var Dio: ControllerDio

@export var ParticleMoney: GPUParticles2D
@export var ParticlePeople: GPUParticles2D
@export var ParticleState: GPUParticles2D

@export var OldMoney: int
@export var OldPeople: int
@export var OldState: int
@export var Change: bool

@export var LabelMoney: Label
@export var LabelPeople: Label
@export var LabelState: Label
@export var TimerInt: int

@export var AmountMoney: int
@export var AmountPeople: int
@export var AmountState: int


func _process(delta):
	
	if (AmountMoney>0):
		AmountMoney-=1
		if(AmountMoney%10==0):
			InstantiateMoney()
	if (AmountPeople>0):
		AmountPeople-=1
		if(AmountPeople%10==0):
			InstantiatePopulation()
	if (AmountState>0):
		AmountState-=1
		if(AmountState%10==0):
			InstantiateGovernment()
	
	if(Change==true):
		TimerInt+=1
		
		if(TimerInt==3):
			TimerInt=0
			if(OldMoney>Dio.Money):
				OldMoney-=1
			if(OldMoney<Dio.Money):
				OldMoney+=1
				
			if(OldPeople>Dio.People):
				OldPeople-=1
			if(OldPeople<Dio.People):
				OldPeople+=1
				
			if(OldState>Dio.State):
				OldState-=1
			if(OldState<Dio.State):
				OldState+=1
		
		if(OldMoney==Dio.Money && OldPeople==Dio.People && OldState==Dio.State):
			Change=false
		LabelMoney.text=str(OldMoney)
		LabelPeople.text=str(OldPeople)
		LabelState.text=str(OldState)
	pass
func PlayCard():
	NormalEffects()
	pass

func NormalEffects():
	var Money: int
	var People: int
	var State: int
	
	var CoinCount: int
	Money= Dio.DataCard.Cards[Dio.SelectedCardId].EconomicAttribute
	People=Dio.DataCard.Cards[Dio.SelectedCardId].PopulationAttribute
	State=Dio.DataCard.Cards[Dio.SelectedCardId].GovernmentAttribute
	
	UpMoney(Money)
	UpState(State)
	UpPeople(People)
	
	
	await get_tree().create_timer(3.0).timeout
	Change=true
	SetParticles(Dio.Money,Dio.People,Dio.State)
	
	
	
	
	
	
	pass



func UpMoney(value: int):
	OldMoney= Dio.Money
	Dio.Money+=value
	AmountMoney+=value
	pass
func UpState(value: int):
	OldState= Dio.State
	Dio.State+=value
	AmountState+=value

	pass
func UpPeople(value: int):
	OldPeople= Dio.People
	Dio.People+=value
	AmountPeople+=value

	
	
	pass

func Instantiate(IdCoin):
	
	if(IdCoin==1):
		TempCoin=TempCoinPeople
		Father=Father2
	if(IdCoin==2):
		TempCoin=TempCoinMoney
		Father=Father3
	if(IdCoin==3):
		TempCoin=TempCoinState
		Father=Father1
	
				
	var Insta = TempCoin.instantiate()
	Father.add_child(Insta)
	Insta.position = Vector2(0,0)
	pass

	
func InstantiatePopulation():
	Instantiate(1)
	
	
func InstantiateMoney():
	Instantiate(2)
	
	
func InstantiateGovernment():
	Instantiate(3)
	
func SetParticles(AmountMoney: int, AmountPeople: int, AmountState: int):
	if(AmountMoney<0):
		AmountMoney=0
	if(AmountPeople<0):
		AmountPeople=0
	if(AmountState<0):
		AmountState=0
	ParticleMoney.amount= AmountMoney
	ParticlePeople.amount= AmountPeople
	ParticleState.amount= AmountState































func _on_play_card_button_2_pressed():
	PlayCard()
	pass # Replace with function body.


func _on_button_particle_pressed():
	
	
	SetParticles(Dio.Money,Dio.People,Dio.State)
	pass # Replace with function body.
