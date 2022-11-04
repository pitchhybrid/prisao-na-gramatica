extends KinematicBody2D

export (Array, String) var dialog_text

var can_interact1: bool = false
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept") and can_interact1:
		can_interact1 = false
		get_tree().call_group("npc","spawn_dialog", dialog_text)

func _ready():
	$Animation.play("idle")
	


func _on_Area_body_entered(body):
	if body.name == "Player":
		can_interact1 = true
