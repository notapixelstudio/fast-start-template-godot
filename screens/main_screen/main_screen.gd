extends "res://screens/basic_screen.gd"

func _ready():
	$Menu.add_constant_override("separation", 6)
	"""
	if !bgm_creation.is_playing():
		bgm_creation.play()
	"""
	$Menu/Start.grab_focus()
	pass

func _on_Start_pressed():
	change_scene()

func _on_Credits_pressed():
	change_scene("res://screens/credit_screen/credit_screen.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
