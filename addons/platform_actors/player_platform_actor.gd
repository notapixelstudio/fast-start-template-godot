extends "platform_actor.gd"

export (String) var left = "ui_left"
export (String) var right = "ui_right"
export (String) var up = "ui_up"
export (String) var down = "ui_down"
export (String) var jump = "jump_1"
export (String) var dash = "dash_1"
func handle_input():
	pass
func _input(event):
	state_machine.state.handle_input(self, event)