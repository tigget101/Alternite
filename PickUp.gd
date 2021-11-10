extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	$AnimationPlayer.play("TorusAction")
	$AnimationPlayer.play("Torus001Action")
	$AnimationPlayer.play("Torus002Action")
	



func _on_Area_body_entered(body):
	if body.name == "Player":
		PlayerStats.change_life(30)
		PlayerStats.change_light(10)
		queue_free()
