extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().quit()


func _on_LinkButton_pressed():
	OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
