extends Button;

@onready var particles = $"../../../Particles"

func _on_pressed():
	particles.reset();
