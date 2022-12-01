extends Node2D

func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if Global.final_quest and Global.final_quest:
		Scene.goto_scene('res://Scenes/level3.tscn')
		Global.enemies = 0
		Global.level_pass = false
		Global.final_quest = false
