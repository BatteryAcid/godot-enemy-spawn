class_name PlayerInput extends Node

var input_direction = 0
var input_jump = 0

func _ready():
	
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_process(false)
		set_physics_process(false)
	
	input_direction = Input.get_axis("move_left", "move_right")

func _physics_process(delta):
	input_direction = Input.get_axis("move_left", "move_right")

func _process(delta):
	input_jump = Input.get_action_strength("jump")
