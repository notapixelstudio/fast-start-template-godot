extends Node

var highscore

func _ready():
	add_to_group("persist")
	persistance.load_game()
	print(highscore)

# utils
func get_state():
	"""
	get_state will return everything we need to be persistent in the game
	"""
	var save_dict = {
		highscore=highscore
	}
	return save_dict

func load_state(data:Dictionary):
	"""
	Set back everything we need to load
	"""
	print(data)
	for attribute in data:
		set(attribute, data[attribute])
