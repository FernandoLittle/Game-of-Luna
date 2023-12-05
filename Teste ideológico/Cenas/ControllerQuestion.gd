extends Node

@export var Olho: Node2D
@export var ScriptableQuestions = []
@export var Textinho: Label
@export var IndexMaster: int =0
@export var ListIntroEN =[]
@export var ListIntroBR =[]
@export var NormalIndex:int=0
@export var IdQuestion:int=0
@export var NextButton: Node
@export var Resposta1Button: Node
@export var Resposta2Button: Node
@export var Resposta1Text: Node
@export var Resposta2Text: Node
@export var Resposta1Node: Node
@export var Resposta2Node: Node
@export var LastQuestion: bool = false
@export var IntResposta = [0,0]
@export var IdAnimation: int =0
#@export var Anime: AnimationPlayer
@export var FigurinhaOlho:Node
@export var FigurinhaBoca:Node
@export var FigurinhaMaçã:Node
@export var FigurinhaMaçãNo:Node
@export var FigurinhaBandeira:Node
@export var FigurinhaRaiz:Node
@export var FigurinhaEstrela:Node
@export var FigurinhaSword:Node
#......................................
@export var AnimeOlho: AnimationPlayer
@export var AnimeBoca:AnimationPlayer
@export var AnimeMaçã:AnimationPlayer
@export var AnimeMaçãNo:AnimationPlayer
@export var AnimeBandeira:AnimationPlayer
@export var AnimeRaiz:AnimationPlayer
@export var AnimeEstrela:AnimationPlayer
@export var AnimeSword:AnimationPlayer
@export var AnimeEbu:AnimationPlayer
@export var ResultTestText: Label
@export var Spook:AnimationPlayer
func SetIntroEN():

	if(NormalIndex>= len(ListIntroEN)):
		IndexMaster+=1
		NormalIndex=0
		print("Set Id quest")

		SetIdQuest()
		ControlAnimation(0)
		ButtonFuncMaster()
	else:	
		Textinho.text= ListIntroEN[NormalIndex]
		NormalIndex+=1
func SetQuestionEN():
	if(NormalIndex>= len(ScriptableQuestions[IdQuestion].PerguntaEN)-1):
		Textinho.text= ScriptableQuestions[IdQuestion].PerguntaEN[NormalIndex]
		IndexMaster+=1
		NormalIndex=0
		NextButton.hide()
		Resposta1Button.show()
		Resposta2Button.show()
		Resposta1Button.text= ScriptableQuestions[IdQuestion].RespostasEN[0]
		Resposta2Button.text= ScriptableQuestions[IdQuestion].RespostasEN[1]
		


	
		#ButtonFuncMaster()
	else:	
		Textinho.text= ScriptableQuestions[IdQuestion].PerguntaEN[NormalIndex] 
		NormalIndex+=1


	
func _on_button_pressed():
	ButtonFuncMaster()
	
	
	print ("eae")
	#Olho.set_process(false)
	#Olho.hide()

func ButtonFuncMaster():
	if(IndexMaster==0):		
		SetIntroEN()
	if(IndexMaster>0):
		SetQuestionEN()

func SetIdQuest():
	#Olha, eu não to orgulhoso, o código tá confuso, saca só, número aléatório vai escolher a pergunta 0 ou 2, depois vai vir a pergunta seguinte porque os testes são feitos em pares de duas pergintas eu não sei se ajudou fodace
	var chaos
	chaos=randi_range(0,2)
	print(chaos)
	if(chaos==0):		
		IdQuestion= 0
	else:
		IdQuestion= 2
		print(IdQuestion)


func _on_resposta_1_pressed():
	if(LastQuestion==false):
		IntResposta[0]=0
		LastQuestion=true
		IdQuestion+=1
		NormalIndex=0
		NextButton.show()
		ButtonFuncMaster()
	else:
		IntResposta[1]=0
		ResultTest()
	ControlAnimation(1)
	Resposta1Button.hide()
	Resposta2Button.hide()



func _on_resposta_2_pressed():
	if(LastQuestion==false):
		IntResposta[0]=1
		LastQuestion=true
		IdQuestion+=1
		NormalIndex=0
		ButtonFuncMaster()
		NextButton.show()
	else:
		IntResposta[1]=1
		ResultTest()
	
	Resposta1Button.hide()
	Resposta2Button.hide()
	ControlAnimation(1)
func ResultTest():
	if(IdQuestion==1):
		if(IntResposta[0]==0 && IntResposta[1]==0):
			ResultTestText.text=("You look like an anarchist")
			print("Anarquista")
		if(IntResposta[0]==0 && IntResposta[1]==1):
			ResultTestText.text=("You look like a libertarian")
			print("Libertário")
		if(IntResposta[0]==1 && IntResposta[1]==0):
			ResultTestText.text=("You look like a communist")
			print("Comunista")
		if(IntResposta[0]==1 && IntResposta[1]==1):
			ResultTestText.text=("You look like a nationalist")
			print("Nacionalista")
	if(IdQuestion==3):
		if(IntResposta[0]==0 && IntResposta[1]==0):
			ResultTestText.text=("You look like a Buddhist")
			print("Budista")
		if(IntResposta[0]==0 && IntResposta[1]==1):
			ResultTestText.text=("You look like a Christian")
			print("Cristão")
		if(IntResposta[0]==1 && IntResposta[1]==0):
			ResultTestText.text=("You look like a atheist")
			print("Ateu")
		if(IntResposta[0]==1 && IntResposta[1]==1):
			ResultTestText.text=("You look like a Muslim")
			print("Mulçumano")
		Spook.play("Spook")
func ControlAnimation(idzinho: int):
	print(IdQuestion)
	IdAnimation=idzinho
	if(IdQuestion==0 || IdQuestion==1 ):
		print("errado")
		if (IdAnimation==0):
			AnimeEbu.play("Ebu Dissolve")
			FigurinhaBandeira.show()
			FigurinhaSword.show()
			AnimeBandeira.play("Anime Nasce")
			AnimeSword.play("Anime Nasce")
		if (IdAnimation==1):
			AnimeSword.play("Anime Dissolve")
			AnimeBandeira.play("Anime Diluir")
			FigurinhaMaçã.show()
			FigurinhaMaçãNo.show()
			AnimeMaçã.play("Anime Nasce")
			AnimeMaçãNo.play("Anime Nasce")
	if(IdQuestion==2 || IdQuestion==3 ):
		print("certo")
		if (IdAnimation==0):
			AnimeEbu.play("Ebu Dissolve")
			FigurinhaEstrela.show()
			FigurinhaRaiz.show()
			AnimeEstrela.play("Anime Nasce")
			AnimeRaiz.play("Anime Nasce")
		if (IdAnimation==1):
			AnimeEstrela.play("Anime Diluir")
			AnimeRaiz.play("Anime Diluir")
			FigurinhaOlho.show()
			FigurinhaBoca.show()
			AnimeBoca.play("Anime Nasce")
			AnimeOlho.play("Anime Nasce")
