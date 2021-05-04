extends KinematicBody



onready var camera = get_parent().get_node("Camera")
export var max_speed = 10
export var friction = 10
export var speed = 1
export var acceleration = 0.5  
export var mouse_sensitivity = 0.3



var move_vector = Vector3.ZERO
var cursor_pos = Vector3.ZERO
var can_fire = true

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		print(event.get_relative())
		rotate_y(deg2rad(-event.get_relative().x) * mouse_sensitivity)

#func look_at_cursor():
#	var player_pos = global_transform.origin
#	var drop_plane = Plane(Vector3(0,1,0), player_pos.y)
#	var ray_length = 1000
#	var mouse_pos = get_viewport().get_mouse_position()
#	var from = camera.project_ray_origin(mouse_pos)
#	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
#	cursor_pos = drop_plane.intersects_ray(from,to)
#	#print(cursor_pos)
#	look_at(cursor_pos, Vector3.UP)
	
func get_input():
	var input = Vector3(
		-int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right")),
		0, 
		-int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	)
	input = input.normalized()
	return input

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
