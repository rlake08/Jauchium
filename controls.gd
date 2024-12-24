extends CharacterBody2D;

var CameraSpeed:int = 400;
var MouseLFunction = "Empty";
var SpawnType: = "none";
var CreateEnabled:bool = false;
@onready var camera_2d = $Camera2D
const NEU_PARTICLE = preload("res://src/particles/neu_particle.tscn")
const POS_PARTICLE = preload("res://src/particles/pos_particle.tscn")
const NEG_PARTICLE = preload("res://src/particles/neg_particle.tscn")
@onready var option_button_2 = $"../CanvasLayer/Control/OptionButton2"
@export var Speed = CameraSpeed;
@onready var node_2d = $".."
@onready var particles = $"../Particles"

func _ready() -> void:
	var size_x = ProjectSettings.get_setting("display/window/size/viewport_width")*(1/camera_2d.zoom.x)
	var size_y = ProjectSettings.get_setting("display/window/size/viewport_height")*(1/camera_2d.zoom.y)
	var _size = Vector2(size_x,size_y)
	WindowSpace.left_edge = global_position.x-size_x/2
	WindowSpace.right_edge = global_position.x+size_x/2
	WindowSpace.top_edge = global_position.y-size_y/2
	WindowSpace.bottom_edge = global_position.y+size_y/2
func MouseExec(Function):
		if Function == "Empty":
			CreateEnabled = false;
		if Function == "Create":
			CreateEnabled = true;

func SpawnParticle(Type):
	if Type == "none":
		pass;
	if Type == "= Particle":
		var _particle = NEU_PARTICLE.instantiate();
		particles.add_child(_particle);
		_particle.global_position = get_global_mouse_position();
	if Type == "+ Particle":
		var _particle = POS_PARTICLE.instantiate();
		particles.add_child(_particle);
		_particle.global_position = get_global_mouse_position();
	if Type == "- Particle":
		var _particle = NEG_PARTICLE.instantiate();
		particles.add_child(_particle);
		_particle.global_position = get_global_mouse_position();

func GetInput():
	var InputDirection = Input.get_vector("left", "right", "up", "down");
	velocity = InputDirection * Speed;
	

func _process(_delta: float) -> void:
	if CreateEnabled == true:
		option_button_2.visible = true
	else:
		option_button_2.visible = false;
	GetInput();
	move_and_slide();

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				var Type = SpawnType;
				if CreateEnabled == true:
					SpawnParticle(Type);
				var Function = MouseLFunction;
				MouseExec(Function);
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.is_pressed():
			camera_2d.zoom *= Vector2(1.1, 1.1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.is_pressed():
			camera_2d.zoom /= Vector2(1.1, 1.1)
