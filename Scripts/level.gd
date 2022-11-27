extends Node2D



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	Scene.goto_scene('res://Scenes/level3.tscn')
	Global.enemies = 0
