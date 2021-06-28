extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Life_Bar.max_value = PlayerStats.max_life
func _process(delta):
	$Life_Bar.value = PlayerStats.get_life()
	$Light_Count.text = str(PlayerStats.get_light())
	$Lives_Count.text = str(PlayerStats.get_lives())
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
