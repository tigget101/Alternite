extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Life_Bar.max_value = PlayerStats.max_life
func _process(delta):
	$Life_Bar.value = PlayerStats.get_life()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
