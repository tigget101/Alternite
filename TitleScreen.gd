extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	UserInterface.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Level.tscn")
	UserInterface.show()


func _on_Options_pressed():
	get_tree().change_scene("res://Scenes/Options_menu.tscn")


func _on_Controls_pressed():
	get_tree().change_scene("res://Controls_Menu.tscn")


func _on_Secret_button_pressed():
	get_tree().change_scene("res://Scenes/Secret_Scene.tscn")


func _on_Exit_pressed():
	get_tree().quit()
