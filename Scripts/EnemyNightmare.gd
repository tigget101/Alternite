extends KinematicBody

var player
var follow_player = false
var move_speed = 25
var move_vec = Vector3.ZERO
var fall = Vector3()
var health = 2
onready var byebye = preload("res://Death_Explosion.tscn")

func hit_nightmare():
	health -= 1
	print(health)
	if health <1:
		Sound.play(Sound.squish)
		var b = byebye.instance()
		b.global_transform = global_transform
		get_parent().add_child(b)
		b.set_emitting(true)
		queue_free()

func _ready():
	pass
	
func _process(delta):
	pass

func _physics_process(delta):	
	if follow_player == true:
		if global_transform.origin.x > player.global_transform.origin.x:
			#print ("go left")
			move_vec.x = -1
			look_at(player.global_transform.origin, Vector3.UP)
			rotation.x = 0
			rotation.z = 0
			translation.z = 0
			move_and_slide(move_vec * move_speed * delta, Vector3.UP)
			$Enemy1/AnimationPlayer.play("ArmatureAction")
			
		else:
			#print("go right")
			move_vec.x = 1
			look_at(player.global_transform.origin, Vector3.UP)
			rotation.x = 0
			rotation.z = 0
			#$CapsuleMesh/MeshInstance.rotation_degrees.y = 180
			move_and_slide(move_vec * move_speed * delta, Vector3.UP)
			$Enemy1/AnimationPlayer.play("ArmatureAction")
		
#		var pos = player.global_transform.origin
#		var facing = -global_transform.basis.z
#		pos.y = 0
#		look_at(pos, Vector3.UP)
#		move_and_slide(facing * move_speed * delta, Vector3.UP)
		

func _on_Area_body_entered(body):
	if body.name == "Player":
		$RayCast.set_enabled(true)
		#print("found player")
		follow_player = true
		player = body


func _on_Area_body_exited(body):
	if body.name == "Player":
		$RayCast.set_enabled(false)
		#print("lost player")
		follow_player = false
	
	pass # Replace with function body.
