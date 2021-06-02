extends KinematicBody

var player
var follow_player = false
var move_speed = 100
var move_vec = Vector3.ZERO
func _physics_process(delta):
	if follow_player == true:
		if global_transform.origin.x > player.global_transform.origin.x:
			print ("go left")
			move_vec.x = -1
			$CapsuleMesh/MeshInstance.rotation_degrees.y = 180
			move_and_slide(move_vec * move_speed * delta, Vector3.UP)
		else:
			print("go right")
			move_vec.x = 1
			$CapsuleMesh/MeshInstance.rotation_degrees.y = 0
			move_and_slide(move_vec * move_speed * delta, Vector3.UP)
		
		
#		var pos = player.global_transform.origin
#		var facing = -global_transform.basis.z
#		pos.y = 0
#		look_at(pos, Vector3.UP)
#		move_and_slide(facing * move_speed * delta, Vector3.UP)
		

func _on_Area_body_entered(body):
	if body.name == "Player":
		$RayCast.set_enabled(true)
		print("found player")
		follow_player = true
		player = body


func _on_Area_body_exited(body):
	if body.name == "Player":
		$RayCast.set_enabled(false)
		print("lost player")
		follow_player = false
	
	pass # Replace with function body.
