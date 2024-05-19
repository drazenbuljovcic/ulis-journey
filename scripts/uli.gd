extends CharacterBody2D

# @TODO fix: joypad keys not working in browser
# gamepad tester
# connect your gamepad via bluetooth
# test it out
# https://hardwaretester.com/gamepad

#
# Ordering
# z index = 1
# y sort enabled
#
# Set the camera on the character first to set the viewport subject
# Next...
# Go to the world scene
# And put a `Camera2D` object there
# The camera from the character will be used as a mock for
# _coordinates of the map camera and the character relatively_
#

# 
# Created this camera based on character's
# Use to adjust `transform` properties
#
# | Transform
# Position
# world | top y position
# world | bottom y position
# world | left x position
# world | right x position

# - Make sure `Window > Scale` is reset to 1

# | `Camera2D` Limit
# top = 0 (relative to the character scene)
# bottom = world | bottom y position

# world | left x position
# world | right x position


const default_speed = 80

const dash_speed = 300
const dash_length = .25

# !!!reference dash!!! > Instantiate Child Scene
# set up input map action for dash "Project > Project settings > Input Map
@onready var Dash = $Dash
 
func _ready():
	$UlisAnimation.play("idle_front")

func _physics_process(delta):
	process_player_movement(delta)
	

func getSpeed(is_running, is_dashing):
	if (is_running):
		return default_speed * 2
	if (is_dashing):
		return dash_speed;
	return default_speed

# player facing down bug after walking up
var prev_direction

func process_player_movement(delta):
	var is_running = Input.is_action_pressed("Run") # shift key
	
	# option key
	if Input.is_action_just_pressed("dash"):
		Dash.start_dash(dash_length)

	var speed = getSpeed(is_running, Dash.is_dashing())
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		velocity.y = 0
		
		prev_direction = "right"
		if (is_running):
			play_animation("right", 2)
		elif(Dash.is_dashing()):
			play_animation("right", 3)
		else:
			play_animation("right", 1)
		
			
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		velocity.y = 0
		
		prev_direction = "left"
		if (is_running):
			play_animation("left", 2)
		elif(Dash.is_dashing()):
			play_animation("left", 3)
		else:
			play_animation("left", 1)
			
	elif Input.is_action_pressed("ui_down"):
		
		velocity.x = 0
		velocity.y = speed
		
		prev_direction = "down"
		if (is_running):
			play_animation("down", 2)
		elif(Dash.is_dashing()):
			play_animation("down", 3)
		else:
			play_animation("down", 1)
		
	elif Input.is_action_pressed("ui_up"):
		
		velocity.x = 0
		velocity.y = -speed
		
		prev_direction = "up"
		if(Dash.is_dashing()):
			play_animation("up", 3)
		elif (is_running):
			play_animation("up", 2)
		else:
			play_animation("up", 1)
		
	else:
		velocity.x = 0
		velocity.y = 0
		play_animation(prev_direction, 0)
	
	
	move_and_slide()

func play_animation(direction, movement):
	var animation = $UlisAnimation
	
	if direction == "right":
		animation.flip_h = false
		
		if (movement == 0):
			animation.play("idle_side")
		
		if (movement == 1):
			animation.play("walking_side")
	
		if (movement == 2):
			animation.play("running_side_right")
			
		if (movement == 3):
			animation.play("dashing_side")
			
	elif direction == "left":
		animation.flip_h = true
		
		if (movement == 0):
			animation.play("idle_side")
		
		if (movement == 1):
			animation.play("walking_side")
			
		if (movement == 2):
			animation.play("running_side_left")
			
		if (movement == 3):
			animation.play("dashing_side")
			
	elif direction == "down":
		if (movement == 0):
			animation.play("idle_front")
		
		if (movement == 1):
			animation.play("walking_front")
			
		if (movement == 2):
			animation.play("running_front")
			
		if (movement == 3):
			animation.play("dashing_front")
			
	elif direction == "up":
		if (movement == 0):
			animation.play("idle_back")
		
		if (movement == 1):
			animation.play("walking_back")
		
		if (movement == 2):
			animation.play("running_back")
			
		if (movement == 3):
			animation.play("dashing_back")
