extends KinematicBody2D

onready var item = preload("res://Items/Letter_A.tscn")
var can_interact: bool = false
export (Array, String) var dialog_text
export (Array, String) var question_text

func _ready():
	$Animation.play("idle")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and can_interact:
		can_interact = false
		get_tree().call_group("Interface","spawn_dialog", dialog_text)
		Global.final_quest = true
	
		
	

func _on_dialog_body_entered(body):
	if body.name == "Player":
		can_interact = true


func _on_dialog_body_exited(body):
	if body.name == "Player":
		can_interact = false
