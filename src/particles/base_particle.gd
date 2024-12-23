extends Node2D
class_name BaseParticle

signal particle_initialize

var direction: Vector2 = Vector2i(0,0)
@export var speed: float = 1.0
@export var charge: int = 0

func _enter_tree() -> void:
	particle_initialize.emit()
	var x = randi_range(-1,1)
	randomize()
	var y = randi_range(-1,1)
	if x==0:
		y = [-1,1].pick_random()
	
	direction = Vector2(x,y).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction*speed*100.0*delta

func set_charge(new_charge: float) -> void:
	charge = new_charge
