extends Node
class_name AnimeController

@export var AnimePlayer1: AnimationPlayer
@export var AnimePlayer2: AnimationPlayer






@export var ActiveCards: bool 



func OpenEye():
	AnimePlayer2.play("IdleBoneco2")
	pass
func CloseEye():
	AnimePlayer2.play("Close Eye")
	pass
func OpenCard():
	if(ActiveCards==false):
		ActiveCards=true
		AnimePlayer1.play("OpenCards")
	pass
func CloseCard():
	if(ActiveCards==true):
		ActiveCards=false
		AnimePlayer1.play("CloseCards")
		pass
