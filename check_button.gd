extends CheckButton;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass; # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_toggled(toggled_on):
	WindowSpace.SpeedOverride = toggled_on
