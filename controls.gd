extends CharacterBody2D;

var MouseLFunction = "Empty";
var SpawnType: = "none";
var CreateEnabled:bool = false;
var original_speed: float = 400.0
@onready var camera_2d = $Camera2D
const NEU_PARTICLE = preload("res://src/particles/neu_particle.tscn")
const POS_PARTICLE = preload("res://src/particles/pos_particle.tscn")
const NEG_PARTICLE = preload("res://src/particles/neg_particle.tscn")
@onready var option_button_2 = $"../CanvasLayer/Control/OptionButton2"
@export var Speed = 400.0;
@onready var node_2d = $".."
@onready var particles = $"../Particles"
@onready var background: TextureRect = $"../Background"

func update_windowspace():
	var size_x = ProjectSettings.get_setting("display/window/size/viewport_width")/camera_2d.zoom.x
	var size_y = ProjectSettings.get_setting("display/window/size/viewport_height")/camera_2d.zoom.y
	WindowSpace.left_edge = global_position.x
	WindowSpace.right_edge = global_position.x+size_x
	WindowSpace.top_edge = global_position.y
	WindowSpace.bottom_edge = global_position.y+size_y

func _ready() -> void:
	original_speed = Speed
	update_windowspace()

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

func GetInput(delta: float):
	var InputDirection = Input.get_vector("left", "right", "up", "down");
	velocity = InputDirection * Speed * delta * 100.0;
	

func _process(delta: float) -> void:
	if CreateEnabled == true:
		option_button_2.visible = true
	else:
		option_button_2.visible = false;
	GetInput(delta);
	move_and_slide();
	background.size = Vector2(1152.0,648.0)/float(camera_2d.zoom.x)
	background.global_position = camera_2d.global_position
	background.material.set("shader_parameter/uv_offset",background.global_position)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				var Type = SpawnType;
				if CreateEnabled == true:
					SpawnParticle(Type);
				var Function = MouseLFunction;
				MouseExec(Function);
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.is_pressed():
			camera_2d.zoom*=Vector2.ONE*1.1
			Speed=clamp(original_speed/camera_2d.zoom.x,0.005,1000000.0)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.is_pressed():
			camera_2d.zoom = clamp(camera_2d.zoom/(Vector2.ONE*1.1),Vector2.ONE*0.000001,Vector2.ONE*100000000.0)
			Speed=clamp(original_speed/camera_2d.zoom.x,0.005,1000000.0)

func _on_texture_button_pressed() -> void:
	camera_2d.zoom = Vector2.ONE
	camera_2d.global_position = Vector2.ONE
