extends Node

onready var shoot = preload("res://mixkit-quick-air-woosh-2605.wav")
onready var falling = preload("res://Resources/mixkit-male-falling-scream-392.wav")
onready var squish = preload("res://mixkit-creature-cry-of-hurt-2208.wav")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func play(sound):
	var audio_stream = AudioStreamPlayer.new()
	self.add_child(audio_stream)
	audio_stream.stream = sound
	audio_stream.play()
	yield(audio_stream, "finished")
	audio_stream.queue_free()
