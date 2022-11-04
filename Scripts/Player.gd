extends KinematicBody2D

onready var animation: AnimationPlayer = get_node("Animation")
onready var sprite: Sprite = get_node("Sprite")
var velocity: Vector2
export (int) var speed

func _physics_process(_delta):
	move()
	verify_direction()
	animate()

func move():
	var direction_vector: Vector2 = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")).normalized()
	velocity = direction_vector * speed
	velocity = move_and_slide(velocity)
	

func animate():
	if velocity != Vector2.ZERO:
		animation.play("run")
	else:
		animation.play("idle")

func verify_direction():
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true	
