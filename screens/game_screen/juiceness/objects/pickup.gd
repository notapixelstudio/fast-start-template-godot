extends Area2D

var taken=false


func _ready():
	$Label.text = name


func _on_pickup_body_entered(body):
	if body.is_in_group("player"):
		body.add_state(name)

