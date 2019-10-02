extends CanvasItem

onready var cursor = $Cursor

func _ready() -> void:
	hide()
	yield(get_tree().create_timer(1), "timeout")
	# start()

func start() -> void:
	$anim.play("show")
	$AudioStreamPlayer.play()
	
	yield($anim, "animation_finished")
	$Options/Play.grab_focus()
	


func _on_btn_play_pressed():
	$Selected.play()
	yield($Selected, "finished")
	get_tree().reload_current_scene()


func _on_Options_focus(focus_node):
	$Focus.play()
	if not cursor.visible:
		cursor.visible = true
	cursor.position.x = $Options.rect_position.x + focus_node.rect_position.x - 30

func _on_Quit_pressed():
	$Selected.play()
	yield($Selected, "finished")
	get_tree().quit()
