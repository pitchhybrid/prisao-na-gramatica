extends KinematicBody2D

onready var book = preload("res://Scenes/Enemy_book.tscn")

export (Array, String) var dialog_text
export (Array, String) var question_text
var can_interact1: bool = false
	
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept") and can_interact1 and Global.enemies < 4:
		can_interact1 = false
		get_tree().call_group("npc","spawn_dialog", dialog_text)
	elif Input.is_action_just_pressed("ui_accept") and can_interact1 and Global.enemies == 4:
		can_interact1 = false
		get_tree().call_group("npc","spawn_dialog", question_text)
		$CanvasLayer.show()
		get_tree().paused = true

func _ready():
	$Animation.play("idle")
	


func _on_Area_body_entered(body):
	if body.name == "Player":
		can_interact1 = true


func _on_Area_body_exited(body):
	if body.name == "Player":
		can_interact1 = false


func _on_Button_pressed():
	get_tree().paused = false
	var instance = book.instance()
	get_parent().get_parent().add_child(instance)
	instance.global_position = self.global_position + Vector2(20,10)
	#$QuestionBox.show()
	$CanvasLayer.queue_free()
	Scene.goto_scene('res://Scenes/level2.tscn')
