extends "res://screens/basic_screen.gd"

func _ready():
	._ready()
	$Back.grab_focus()

func _on_Button_pressed():
	change_scene()
