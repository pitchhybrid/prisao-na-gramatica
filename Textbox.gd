extends CanvasLayer

const CHAR_READ_RATE = 0.05

onready var textbox_container = $TextboxContainer
onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label

func _ready():
	hide_textbox()
	add_text("Qual Palavra Está Escrita Corretamente:")
	
func hide_textbox():
	label.text = ""	
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text):
	label.text = next_text
	show_textbox()
	$Tween.interpolate_property(label, "percent_visible",0.0,1.0,len(next_text)*CHAR_READ_RATE,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
