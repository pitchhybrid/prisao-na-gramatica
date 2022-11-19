extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VideoPlayer.set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $VideoPlayer.is_playing():
		$VideoPlayer.play()


func _on_Button_pressed():
	Scene.goto_scene("res://Scenes/level.tscn")
	pass # Replace with function body.
