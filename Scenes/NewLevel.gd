extends StaticBody




func _on_Area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/Level_2.tscn")
