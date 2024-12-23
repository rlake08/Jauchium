extends CheckButton

const PosParticle = preload("res://src/particles/pos_particle.gd")
const BaseParticle = preload("res://src/particles/base_particle.gd")
const NegParticle = preload("res://src/particles/neg_particle.gd")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			get_tree().paused = true;
