extends KinematicBody2D

func _ready():
	$Animation.play("idle")

func _on_Area2D_body_entered(body):
	$Animation.play("open")
