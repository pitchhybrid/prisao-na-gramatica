extends CanvasLayer

export (String) var correct

signal correct_answer


func _ready():
	pass


func _on_Blue_button_pressed():
	if correct == "blue":
		emit_signal("correct_answer")
		get_tree().paused = false
		queue_free()
	else:
		Global.pontos -= 100
		$QuestionContainer/PanelContainer/MarginContainer/Rows/Blue_button.queue_free()


func _on_Yellow_button_pressed():
	if correct == "yellow":
		emit_signal("correct_answer")
		get_tree().paused = false
		queue_free()
	else:
		Global.pontos -= 100
		$QuestionContainer/PanelContainer/MarginContainer/Rows/Yellow_button.queue_free()


func _on_Green_button_pressed():
	if correct == "green":
		emit_signal("correct_answer")
		get_tree().paused = false
		queue_free()
	else:
		Global.pontos -= 100
		$QuestionContainer/PanelContainer/MarginContainer/Rows/Green_button.queue_free()
