extends OptionButton;

@onready var character_body_2d = $"../../../CharacterBody2D";
@onready var option_button = $"../OptionButton"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass;

func _on_item_selected(index):
	if (index == 0):
		character_body_2d.SpawnType = "none";
	if (index == 1):
		character_body_2d.SpawnType = "= Particle";
		option_button.selected = 1;
	if (index == 2):
		character_body_2d.SpawnType = "+ Particle";
		option_button.selected = 1;
	if (index == 3):
		character_body_2d.SpawnType = "- Particle";
		option_button.selected = 1;
