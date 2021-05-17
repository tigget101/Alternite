extends KinematicBody

onready var camera = get_parent().get_node("Camera")

export var max_speed = 3.5
export var friction = 10
export var speed = 2.95
export var acceleration = 10
var move_vector = Vector3.ZERO
var cursor_pos = Vector3.ZERO
var gravity = 6
var jump = 3.5
var fall = Vector3()
var direction = Vector3()
var velocity = Vector3()
var jump_count = 0

func _process(delta):
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		fall.y = jump
		
	if not is_on_floor():
		fall.y -= gravity * delta
		
	direction = Vector3()
	
	if Input.is_action_pressed("ui_left"):
		direction += transform.basis.z
		
	elif Input.is_action_pressed("ui_right"):
		direction -= transform.basis.z
		
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
	move_and_slide(fall, Vector3.UP)

		

		
	
	


func _ready():
	pass


			
			

			
			
		
