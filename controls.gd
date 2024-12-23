extends CharacterBody2D;

var CameraSpeed:int = 400;
var MouseLFunction: = "Empty";
@onready var camera_2d = $Camera2D


@export var Speed = CameraSpeed;

func MouseExec(Function):
	print (Function); #Placeholder Function
#Add elif statement for creating particles that links to an external script
func GetInput():
	var InputDirection = Input.get_vector("left", "right", "up", "down");
	velocity = InputDirection * Speed;
	

func _process(_delta: float) -> void:
	GetInput();
	move_and_slide();

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				var Function = MouseLFunction;
				MouseExec(Function);
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.is_pressed():
			camera_2d.zoom *= Vector2(1.1, 1.1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.is_pressed():
			camera_2d.zoom /= Vector2(1.1, 1.1)
