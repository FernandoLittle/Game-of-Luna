extends Node2D
@export var Me: Node2D
@export var Destiny: Vector2
var Chaos: float
@export var Particle: CPUParticles2D
@export var Self: Node2D
@export var Anime: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Chaos=randf_range(2,4)
	var Move = get_tree().create_tween()
	Move.tween_property(Me,"position",Destiny,Chaos)
	
	Anime.play("new_animation")
	
	await get_tree().create_timer(Chaos).timeout
	Particle.emitting=true
	await get_tree().create_timer(1).timeout
	Self.queue_free()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
