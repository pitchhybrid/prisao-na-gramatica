extends Area2D

onready var blue_button = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Blue_button
onready var yellow_button = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Yellow_button
onready var green_button = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Green_button
onready var question_label = $QuestionBox/QuestionContainer/PanelContainer/MarginContainer/Rows/Label

export (String) var question
export (String) var blue_text
export (String) var yellow_text
export (String) var green_text
export (String) var correct

var dialog: bool = true
var can_interact1: bool = false


func _physics_process(_delta):
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
	Global.add_enemy(1)

func _on_Enemy_1_body_entered(body):
	if body.name == "Player":
		can_interact1 = true
