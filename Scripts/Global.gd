extends Node

var pontos = 300
var score: int = 0

var enemies: int = 0

func add_enemy(amount: int):
	enemies += amount

func reset_enemies():
	enemies = 0
	
func add_score(amount: int):
	score +=amount
