extends CanvasLayer
class_name Interface

const DIALOG: PackedScene = preload("res://Interface/Dialog.tscn")

func spawn_dialog(dialog_text_list: Array):
	var dialog: Dialog = DIALOG.instance()
	dialog.dialog_text_list = dialog_text_list
	add_child(dialog)

