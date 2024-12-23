extends Node2D
class_name BaseParticle

signal hit_particle(particle_hit: BaseParticle)

var OriginSpeed
var direction: Vector2 = Vector2(0,0)
var goal_direction: Vector2 = Vector2(0,0)
@export var particle_base_collision_volume: Area2D = null
@export var speed: float = 1.0
@export var charge: int = 0

func _enter_tree() -> void:
	OriginSpeed = speed
	var x = randi_range(-1,1)
	randomize()
	var y = randi_range(-1,1)
	if x==0:
		y = [-1,1].pick_random()
	
	goal_direction = Vector2(x,y).normalized()

func _ready() -> void:
	particle_base_collision_volume.area_entered.connect(hit_stuff)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var freeze = 1
	if WindowSpace.SpeedOverride == true:
		freeze = 0
	elif WindowSpace.SpeedOverride == false:
		freeze = 1
	speed = OriginSpeed * freeze
	direction = lerp(direction,goal_direction,0.02)
	global_position += direction*speed*100.0*delta
	if global_position.x < WindowSpace.left_edge or global_position.x > WindowSpace.right_edge:
		goal_direction.x*=-1
		direction.x *= -1
	if global_position.y < WindowSpace.top_edge or global_position.y > WindowSpace.bottom_edge:
		goal_direction.y*=-1
		direction.y *= -1

func set_charge(new_charge: float) -> void:
	charge = new_charge

func hit_stuff(area: Area2D):
	if area.get_owner() is not BaseParticle: return
	hit_particle.emit(area.get_owner())
