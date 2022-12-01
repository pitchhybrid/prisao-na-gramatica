extends KinematicBody2D

onready var book_tiradentes = preload("res://Scenes/book_Tiradentes.tscn")

export (Array, String) var dialog_text
export (Array, String) var question_text
var can_interact1: bool = false
	

onready var blue_button = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Blue_button
onready var yellow_button = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Yellow_button
onready var green_button = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Green_button
onready var question_label = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Label

export (String) var question
export (String) var blue_text
export (String) var yellow_text
export (String) var green_text
export (String) var correct	

	
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept") and can_interact1 and Global.enemies < 5:
		can_interact1 = false
		get_tree().call_group("npc","spawn_dialog", dialog_text)
	elif Input.is_action_just_pressed("ui_accept") and can_interact1 and Global.level_pass == false and Global.final_quest == false and Global.enemies == 5:
		can_interact1 = false
		get_tree().call_group("npc","spawn_dialog", question_text)
		$CanvasLayer.show()
		get_tree().paused = true
	elif Input.is_action_just_pressed("ui_accept") and can_interact1 and Global.final_quest:
		Global.final_quest = false
		can_interact1 = false
		$QuestionBox.show()
		Global.level_pass = true
	elif Input.is_action_just_pressed("ui_accept") and can_interact1 and Global.level_pass:
		can_interact1 = false

func _ready():
	$AnimatedSprite.play("idle")
	question_label.text = question
	blue_button.text = blue_text
	yellow_button.text = yellow_text
	green_button.text = green_text
	$QuestionBox.correct = correct
	

func _on_Button_pressed():
	get_tree().paused = false
	var instance = book_tiradentes.instance()
	get_parent().get_parent().add_child(instance)
	instance.global_position = self.global_position + Vector2(50,50)
	#$QuestionBox.show()
	$CanvasLayer.queue_free()
	


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		can_interact1 = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		can_interact1 = false
		
func _on_QuestionBox_correct_answer():
	Global.add_score(Global.pontos)
	Global.pontos = 300
	self.global_position += Vector2(30,25)
