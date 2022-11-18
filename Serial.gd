extends Node

const serial_res = preload("res://bin/gdserial.gdns")
onready var serial_port = serial_res.new()

var is_port_open = false
var text = ""

signal ataca(player)
signal pula(player)
signal joystick(direcao)


func _ready():
	open()
	pass


func _exit_tree():
	close()


func open():
	is_port_open = serial_port.open_port("/dev/ttyACM0", 115200)
	if is_port_open:
		print('Conectado')
	else:
		print('Desconectado')


func write(text):
	serial_port.write_text(text)


func close():
	is_port_open = false
	serial_port.close_port()


func _process(delta):
	if is_port_open:
		var t = serial_port.read_text()
		print(t)
		if t.length() > 0:
			for c in t:
				if c == "\n":
					emulate(text)
					text = ""
				else:
					text+=c
			#print(t)
		


"""
* Função que trata o recebimento dos dados, seguindo o seguinte protocolo:
**** Botões -> Exemplo: "1 Sobe" (Player 1 sobe)
**** Potenciômetros -> Exemplo: "2 -7" (Player 2 desloque em direção a -7)
**** Joystick -> Exemplo: "1 5 -2" (Player 1 desloque na direção 5 em x e -2 em y)
"""
func on_text_received(text):
	var command_array = text.split(" ")
	print(command_array)
	
	if len(command_array) < 2:
		return

	if str(command_array[1]) == "Sobe":
		emit_signal("sobe", command_array[0])
	elif command_array[1] == "Desce":
		emit_signal("desce", command_array[0])
	elif len(command_array) == 2:
		emit_signal("potenciometro", command_array[0], command_array[1])
	else:
		emit_signal("joystick", command_array[0], command_array[1], command_array[2])

func emulate(command):
	var a = InputEventAction.new()
	a.action = command
	a.pressed = true
	Input.parse_input_event(a)
	
