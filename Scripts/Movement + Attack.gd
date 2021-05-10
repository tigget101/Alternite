extends KinematicBody

onready var camera = get_parent().get_node("Camera")

export var max_speed = 3.5
export var friction = 10
export var speed = 1
export var acceleration = 0.5



var move_vector = Vector3.ZERO
var cursor_pos = Vector3.ZERO
var gravity = 4
var jump = 2.2
var sproing = Vector3()
var max_jump = 0

func get_input():
	var input = Vector3(
		int(Input.is_action_pressed("ui_left")) -int(Input.is_action_pressed("ui_right")),
		0,
		0
	)
	input = input.normalized()
	return input
	
func _process(delta):
	if is_on_floor():
		max_jump = 0
	if not is_on_floor():
		sproing.y -= gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if max_jump == 0:
			sproing.y = jump
			max_jump == 1
	
	if Input.is_action_just_pressed("jump") and not is_on_floor():
		if max_jump == 1:
			sproing.y = jump
			max_jump = 2
			
	move_and_slide(sproing, Vector3.UP)
	

func _physics_process(delta):
	var input = get_input()
	if input != Vector3.ZERO:
		speed += acceleration
		if speed > max_speed:
			speed = max_speed
			
	move_vector = input * speed
	move_and_slide(move_vector)
			
			
			
			
			
		
