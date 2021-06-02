extends Camera


var camera_pos = Vector3.ZERO
onready var player_follow = get_parent().get_node("Player")

func _process(delta):
	
	camera_pos.x = player_follow.translation.x
	camera_pos.y = player_follow.translation.y + 1
	camera_pos.z = get_translation().z
	set_translation(camera_pos)
