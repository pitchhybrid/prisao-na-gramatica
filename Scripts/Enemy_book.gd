extends KinematicBody2D

onready var item = preload("res://Items/Letter_A.tscn")


func _ready():
	$Animation.play("idle")



	
	


#func _on_hitBox_body_entered(body):
	
	#var instance = item.instance()
	#get_parent().get_parent().add_child(instance)
	#instance.global_position = self.global_position
	
	#queue_free()
	
