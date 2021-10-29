extends Area




func _on_Transport_Portal_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/Level_1.tscn")
	pass # Replace with function body.
