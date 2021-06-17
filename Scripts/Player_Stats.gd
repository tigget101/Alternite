extends Node

var life 
var max_life
var light
var max_light
var lives
var max_lives

func _ready():
	life = 100
	max_life = 150
	light = 100
	max_light = 100
	lives = 3
	max_lives = 5
	
func change_life(amount):
	life += amount
	life = clamp(life,0, max_life)
	
func change_light(amount):
	light += amount
	light = clamp(light,0, max_light)

func change_lives(amount):
	lives += amount
	lives = clamp(lives,0, max_lives)
	
func get_life():
	return life
	
func get_light():
	return light
	
func get_lives():
	return lives
	
func has_ammo():
	return light > 0
