extends KinematicBody

onready var camera = get_parent().get_node("Camera")
onready var projectile = preload("res://Scenes/PlayerFire.tscn")

export var max_speed = 2.5
export var friction = 10
export var speed = 2.95
export var acceleration = 10
var move_vector = Vector3.ZERO
var cursor_pos = Vector3.ZERO
var gravity = 9.8
var jump = 5
var fall = Vector3()
var direction = Vector3()
var velocity = Vector3()
var jump_count = 0
var can_fire = true
var facing = "right"

func _process(delta):
	
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
	move_and_slide(fall, Vector3.UP)
	translation.z = 0
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		fall.y = jump
		jump
		
	if not is_on_floor():
		fall.y -= gravity * delta
		
	direction = Vector3()

	if Input.is_action_pressed("ui_right"):
		direction += transform.basis.x
		$Hooman.rotation_degrees.y = 270
		facing = "left"
		$Hooman/AnimationPlayer.play("Running")
		
	elif Input.is_action_pressed("ui_left"):
		direction -= transform.basis.x
		$Hooman.rotation_degrees.y = 90
		facing = "right"
		$Hooman/AnimationPlayer.play("Running")
	if Input.is_action_just_pressed("shoot") and can_fire and PlayerStats.has_ammo():
		
		PlayerStats.change_light(-1)
		#check_hit()
		
		can_fire = false
		var new_projectile = projectile.instance()
		new_projectile.global_transform = $CapsuleMesh/PointDirection/Position3D.global_transform
		new_projectile.facing = facing
		get_parent().add_child(new_projectile)
		
		
		
		
		$ProjectileTimer.set_wait_time(0.35)
		$ProjectileTimer.start()
		
	if PlayerStats.get_life() <= 0:
		get_tree().reload_current_scene()
		PlayerStats.change_lives(-1)
		PlayerStats.reset()
		
	if PlayerStats.get_lives() <= 0:
		get_tree().quit()
		
	


		
func check_hit():
	if $CapsuleMesh/HitScan.is_colliding():
		print($CapsuleMesh/HitScan.get_collider().filename)
		if $CapsuleMesh/HitScan.get_collider().filename == "res://Scenes/EnemyNightmare.tscn":
			$CapsuleMesh/HitScan.get_collider().hit_nightmare()
		
		
			

		
	
 
		
		
		
		
		
		
		



		

		
	
	


func _ready():
	pass


			
			

			
			
		



	


func _on_ProjectileTimer_timeout():
	can_fire = true
	


func _on_Area_body_entered(body):
	if body.filename == "res://Scenes/EnemyNightmare.tscn":
		PlayerStats.change_life(-40)
		
		
	pass # Replace with function body.
