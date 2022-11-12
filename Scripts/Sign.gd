extends StaticBody2D

export (Array, String) var dialog_text

var can_interact: bool = false
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept") and can_interact:
		can_interact = false
		get_tree().call_group("Interface","spawn_dialog", dialog_text)


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		can_interact = true
	


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		can_interact = false
