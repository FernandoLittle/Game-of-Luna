extends Node
@export var CardsPosition: Node2D
@export var PositionY: float
@export var AnimeController0: AnimeController


func _on_control_mouse_entered():
	
	AnimeController0.OpenCard()
	
	
	
	#var MyTween1
	#MyTween1=get_tree().create_tween()
	#MyTween1.tween_property(CardsPosition,"position",Vector2(CardsPosition.position.x, PositionY),0.5)
	pass # Replace with function body.
