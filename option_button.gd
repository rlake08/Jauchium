extends OptionButton;

@onready var character_body_2d = $"../../../CharacterBody2D";
@onready var option_button_2 = $"../OptionButton2"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass;


func _on_item_selected(index):
	if (index == 0):
		character_body_2d.MouseLFunction = "Empty";
		character_body_2d.CreateEnabled = false;
		option_button_2.visible = false;
		option_button_2.selected = 0;
		character_body_2d.SpawnType = "none";
	if (index == 1):
		character_body_2d.MouseLFunction = "Create";
		character_body_2d.CreateEnabled = true;
		option_button_2.visible = true;
	if (index == 2):
		character_body_2d.MouseLFunction = "Remove";
		option_button_2.visible = false;
