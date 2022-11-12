extends Node

var enemies: int = 0

func add_enemy(amount: int):
	enemies += amount

func reset_enemies():
	enemies = 0
