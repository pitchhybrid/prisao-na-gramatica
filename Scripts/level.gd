extends Node2D



func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	Scene.goto_scene('res://Scenes/level2.tscn')
	Global.enemies = 0
	Global.level_pass = false
	Global.final_quest = false
