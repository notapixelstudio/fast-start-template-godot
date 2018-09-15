extends "platform_actor.gd"

export (String) var left = "ui_left"
export (String) var right = "ui_right"
export (String) var up = "ui_up"
export (String) var down = "ui_down"
export (String) var jump = "ui_select"
export (String) var dash = "ui_cancel"


func _ready():
	set_process_input(false)


# add a node, specified by its script gd in the actor state_machine
func add_state(state_name):
	if state_machine.get_node(state_name):
		return false
	var new_state = load("res://actors/state_machine/states/"+state_name+".gd").new()
	state_machine.add_child(new_state)
	new_state.name=state_name
	print(new_state.name)
	return true

# in case we need to remove it.
func remove_state(state_name):
	var state_to_remove = state_machine.get_node("state_name")
	state_machine.remove_child(state_to_remove)
	return true
	
func handle_input():
	pass

func _input(event):
	state_machine.state.input_process(self, event)