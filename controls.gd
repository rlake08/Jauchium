extends CharacterBody2D;

var CameraSpeed:int = 400;
var MouseLFunction: = "Empty";
@onready var camera_2d = $Camera2D


@export var Speed = CameraSpeed;

func _ready() -> void:
	var size_x = ProjectSettings.get_setting("display/window/size/viewport_width")*(1/camera_2d.zoom.x)
	var size_y = ProjectSettings.get_setting("display/window/size/viewport_height")*(1/camera_2d.zoom.y)
	var size = Vector2(size_x,size_y)
	WindowSpace.left_edge = global_position.x-size_x/2
	WindowSpace.right_edge = global_position.x+size_x/2
	WindowSpace.top_edge = global_position.y-size_y/2
	WindowSpace.bottom_edge = global_position.y+size_y/2

func MouseExec(Function):
	print (Function); #Placeholder Function
#Add elif statement for creating particles that links to an external script
func GetInput():
	var InputDirection = Input.get_vector("left", "right", "up", "down");
	velocity = InputDirection * Speed;
	

func _process(_delta: float) -> void:
	GetInput();
	move_and_slide();

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				var Function = MouseLFunction;
				MouseExec(Function);
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.is_pressed():
			camera_2d.zoom *= Vector2(1.1, 1.1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.is_pressed():
			camera_2d.zoom /= Vector2(1.1, 1.1)
