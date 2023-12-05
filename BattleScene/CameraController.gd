extends Node
@export var Camerazinha: Node2D
@export var Camerazinha1: Camera2D
@export var Speed: int
@export var DirectionY: int
@export var DirectionX: int
@export var ZoomX: float =1
@export var ZoomY: float =1



# Called when the node enters the scene tree for the first time.
func _ready():
	print(ZoomY)
	print(Camerazinha.zoom.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	Camerazinha.position.x += Speed*delta*DirectionX
	Camerazinha.position.y += Speed*delta*DirectionY
	if(Input.is_action_just_released("Zoom")):
		if(ZoomX<2 && ZoomY<2):
			ZoomX+=0.1
			ZoomY+=0.1
			print(ZoomX)
			ZoomPlau()
			#var MyTween
			#MyTween=get_tree().create_tween()
			#MyTween.tween_property(Camerazinha1,"zoom",Vector2(ZoomX,ZoomY),1)
		print(Camerazinha1.zoom.x)
	if(Input.is_action_just_released("ZoomOut")):
		if(ZoomX>0.5 && ZoomY>0.5):
			ZoomX-=0.1
			ZoomY-=0.1
			print(ZoomX)
			ZoomPlau()
			#var MyTween1
			#MyTween1=get_tree().create_tween()
			#MyTween1.tween_property(Camerazinha1,"zoom",Vector2(ZoomX,ZoomY),1)
func ZoomPlau():
	var MyTween1
	MyTween1=get_tree().create_tween()
	MyTween1.tween_property(Camerazinha1,"zoom",Vector2(ZoomX,ZoomY),0.5)





func _on_left_camera_mouse_entered():
	DirectionY=0
	DirectionX=-1

	
func _on_right_camera_mouse_entered():
	DirectionY=0
	DirectionX=1


func _on_down_camera_mouse_entered():
	DirectionY=1
	DirectionX=0


func _on_top_camera_mouse_entered():
	DirectionY=-1
	DirectionX=0


func _on_top_left_mouse_entered():
	DirectionY=-1
	DirectionX=-1


func _on_down_left_mouse_entered():
	DirectionY=1
	DirectionX=-1


func _on_down_right_mouse_entered():
	DirectionY=1
	DirectionX=1


func _on_top_right_mouse_entered():
	DirectionY=-1
	DirectionX=1


func _on_left_camera_mouse_exited():
	DirectionY=0
	DirectionX=0


func _on_right_camera_mouse_exited():
	DirectionY=0
	DirectionX=0


func _on_down_camera_mouse_exited():
	DirectionY=0
	DirectionX=0


func _on_top_camera_mouse_exited():
	DirectionY=0
	DirectionX=0


func _on_top_left_mouse_exited():
	DirectionY=0
	DirectionX=0


func _on_down_left_mouse_exited():
	DirectionY=0
	DirectionX=0


func _on_down_right_mouse_exited():
	DirectionY=0
	DirectionX=0


func _on_top_right_mouse_exited():
	DirectionY=0
	DirectionX=0
