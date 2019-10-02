extends CanvasItem

onready var cursor = $Cursor
export var game_scene: PackedScene

func start() -> void:
	$anim.play("show")
	$AudioStreamPlayer.play()
	yield($anim, "animation_finished")
	$Options/Play.grab_focus()
	
	
func _ready():
	start()

func _on_Options_focus(focus_node):
	$Focus.play()
	if not cursor.visible:
		cursor.visible = true
	cursor.position.x = $Options.rect_position.x + focus_node.rect_position.x - 30


func _on_Play_pressed():
	$Selected.play()
	yield($Selected, "finished")
	get_tree().change_scene_to(game_scene)


func _on_Quit_pressed():
	$Selected.play()
	yield($Selected, "finished")
	get_tree().quit()
