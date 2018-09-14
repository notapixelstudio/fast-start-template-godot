extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 25
const SPEED = 200
const JUMP = 400
const WATER_K = 4

var tilemap
var tiledict
var dead

var floating = 0
var sea_level


var motion = Vector2()

# array of deadboxes, we need it to remove them when level is completed
var deadboxes = []

# signal for camera
signal move

func _ready():
	pass

func _physics_process(delta):
	motion.y += GRAVITY
	var is_moving = Input.is_action_pressed('ui_right') or Input.is_action_pressed('ui_left') or Input.is_action_pressed('ui_up');
	
	if Input.is_action_pressed('ui_right') and not Input.is_action_pressed('ui_left'):
		motion.x = SPEED
		$Sprite.flip_h = false
	elif Input.is_action_pressed('ui_left') and not Input.is_action_pressed('ui_right'):
		motion.x = -SPEED
		$Sprite.flip_h = true
		
	else:
		motion.x = 0
		
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		motion.y = -JUMP
		
	if Input.is_action_just_released('ui_up') and motion.y < 0:
		motion.y = 0
	
	motion = move_and_slide(motion, UP)
	if is_moving:
		emit_signal("move");
	
func enter_water():
	if not floating:
		sea_level = position.y
	floating += 1
	
func exit_water():
	floating -= 1
	
func respawn():
	position = Vector2(32,32)