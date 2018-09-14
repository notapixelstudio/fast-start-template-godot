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
	dead = load('res://Dead.tscn')

func create_deadbox():
    var new_dead = dead.instance()
    deadboxes.push_back(new_dead)
    return new_dead

func remove_deadbox(who): # in case of removing individual enemy
    deadboxes.erase(who)
    who.queue_free()

func clear_map():
    for deadbox in deadboxes:
        deadbox.queue_free()
    deadboxes.clear()

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
	
	# iterate on collisions
	for i in range(get_slide_count()):
		var collider = get_slide_collision(i).get_collider()
		if collider.get_name() == 'harmful':
			var new_dead = create_deadbox()
			
			get_parent().add_child(new_dead)
			var tile_position = collider.world_to_map(get_slide_collision(i).get_position())
			new_dead.position = tile_position * 16
			
			# snap to grid
			new_dead.position.x = round(new_dead.position.x / 16) * 16
			new_dead.position.y = round(new_dead.position.y / 16) * 16
			
			# set eyes direction
			new_dead.get_node('eyes').flip_h = $Sprite.flip_h
			
			# delete tile to disable collisions WARNING: this does not delete the art tile!
			collider.set_cellv(tile_position, -1)
			
			respawn()
		
	
	if floating:
		motion.y -= WATER_K * (position.y - sea_level)
	
func enter_water():
	if not floating:
		sea_level = position.y
	floating += 1
	
func exit_water():
	floating -= 1
	
func respawn():
	position = Vector2(32,32)

# water movement
# https://www.habrador.com/tutorials/unity-boat-tutorial/3-buoyancy/