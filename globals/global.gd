# global script
extends Node 

func _ready():
	# if we want to save data from global
	add_to_group("persist")
	pass

func get_state():
	var save_dict = {
		# whatever we want to save
	}
	return save_dict

func load_state(data):
	for attribute in data:
		set(attribute, data[attribute])