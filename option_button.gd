extends OptionButton;

@onready var character_body_2d = $"../../../CharacterBody2D";

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass;


func _on_item_selected(index):
	if (index == 0):
		character_body_2d.MouseLFunction = "Empty";
	if (index == 1):
		character_body_2d.MouseLFunction = "Create";
	if (index == 2):
		character_body_2d.MouseLFunction = "Remove";
