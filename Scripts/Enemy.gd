extends KinematicBody2D

onready var blue_button = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Blue_button
onready var yellow_button = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Yellow_button
onready var green_button = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Green_button
onready var question_label = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Label

onready var p = $"../Player"
var speed = 30
var motion = Vector2(0,0)
var go = false


export (String) var question
export (String) var blue_text
export (String) var yellow_text
export (String) var green_text
export (String) var correct

var dialog: bool = true
var can_interact1: bool = false


func _physics_process(_delta):
	if go == true:
		motion = position.direction_to(p.position)*speed
	else:
		motion = Vector2(0,0)
	motion = move_and_slide(motion)
	
	if Input.is_action_just_pressed("ui_accept") and can_interact1 and dialog:
		can_interact1 = false
		dialog = false
		$QuestionBox.show()
		get_tree().paused = true


func _ready():
	$Animation.play("jump")
	question_label.text = question
	blue_button.text = blue_text
	yellow_button.text = yellow_text
	green_button.text = green_text
	$QuestionBox.correct = correct
	
	
func _on_QuestionBox_correct_answer():
	$Animation.play("hit")
	go = false
	$Area2D/CollisionShape2D.queue_free()
	Global.add_enemy(1)
	Global.add_score(Global.pontos)
	Global.pontos = 300
	print(Global.score)


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		go = true


func _on_Dialog_body_entered(body):
	if body.name == "Player":
		can_interact1 = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		go = false


func _on_Dialog_body_exited(body):
	if body.name == "Player":
		can_interact1 = false
