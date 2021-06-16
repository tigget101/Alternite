extends RigidBody


const UP_RIGHT = Vector3.UP + Vector3.RIGHT 
const UP_LEFT = Vector3.UP + Vector3.LEFT

var facing

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("ignore")
	if facing == "right":
		apply_impulse(Vector3.ZERO , UP_RIGHT * 3)
	elif facing == "left": 
		apply_impulse(Vector3.ZERO , UP_LEFT * 3)
	pass

func _physics_process(delta):
	pass





func _on_Area_body_entered(body):
	if body.name == "RigidBody":
		queue_free()
	elif body.name == "EnemyNightmare":
		queue_free()
	elif body.name == "RigidBody2":
		queue_free()
	elif body.name == "Platform":
		queue_free()
	else:
		pass
