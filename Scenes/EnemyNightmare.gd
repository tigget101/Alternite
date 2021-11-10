extends KinematicBody

var player
var follow_player = false
var move_speed = 25
var move_vec = Vector3.ZERO
var fall = Vector3()
var health = 2
onready var byebye = preload("res://Death_Explosion.tscn")



func _ready():
	print(rotation_degrees)
	pass
	
func _process(delta):
	pass

func _physics_process(delta):	
	if follow_player == true:
		if global_transform.origin.x > player.global_transform.origin.x:
			#print ("go left")
			move_vec.x = -1
			
			rotation_degrees.y=0

			move_and_slide(move_vec * move_speed * delta, Vector3.UP)
			#translation.y = 0
			translation.z = 0
			
			$Enemy1/AnimationPlayer.play("ArmatureAction")
			
		else:
			#print("go right")
			move_vec.x = 1
			
			rotation_degrees.y=180

			move_and_slide(move_vec * move_speed * delta, Vector3.UP)
#			translation.y = 0
			translation.z = 0
			$Enemy1/AnimationPlayer.play("ArmatureAction")
		


			move_and_slide(move_vec* move_speed * delta, Vector3.UP)
		

func _on_Area_body_entered(body):
	if body.name == "Player":
		$RayCast.set_enabled(true)
		#print("found player")
		follow_player = true
		player = body
	
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


func _on_Area_body_exited(body):
	if body.name == "Player":
		$RayCast.set_enabled(false)
		#print("lost player")
		follow_player = false
	
	pass # Replace with function body.
