extends StaticBody2D

var can_interact: bool = false

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept") and Global.level_pass and can_interact:
		Global.level_pass = false
		$Sprite.queue_free()
		$Sprite2.show()
		$CollisionShape2D.queue_free()
		
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		can_interact = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		can_interact = false
