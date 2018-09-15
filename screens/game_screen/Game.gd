extends Node

var debug = false
onready var DebugNode = get_node("DebugNode")

func _ready():
	# random generating AI guys
	for i in rand_range(3, 10):
		var d = load("res://actors/AIWithState.tscn").instance()
		d.position = $AI.position + Vector2(rand_range(-200, 200), rand_range(-200, 200))
		add_child(d)
		
func _input(event):
	var debug_pressed = event.is_action_pressed("debug")
	if debug_pressed:
		debug = not debug
		DebugNode.visible = debug

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
