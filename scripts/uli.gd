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


const defaultSpeed = 80
 
func _ready():
	$UlisAnimation.play("idle_front")

func _physics_process(delta):
	
	process_player_movement(delta)
	


#var isRunning
#func effectIsRunning():
	## ProjectSettings > Input map
	#isRunning = Input.is_action_pressed("Run") # is shift key pressed



func getSpeed(isRunning):
	if (isRunning):
		return defaultSpeed * 2
	return defaultSpeed

# player facing down bug after walking up
var prevUpKeyPressed

func process_player_movement(delta):
	var isRunning = Input.is_action_pressed("Run") # is shift key pressed
	var speed = getSpeed(isRunning)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		velocity.y = 0
		
		if (isRunning):
			play_animation("right", 2)
		else:
			play_animation("right", 1)
			
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		velocity.y = 0
		play_animation("left", 1)
		
		if (isRunning):
			play_animation("left", 2)
		else:
			play_animation("left", 1)
			
	elif Input.is_action_pressed("ui_down"):
		prevUpKeyPressed = false;
		
		velocity.x = 0
		velocity.y = speed
		play_animation("down", 1)
		
	elif Input.is_action_pressed("ui_up"):
		prevUpKeyPressed = true;
		
		velocity.x = 0
		velocity.y = -speed
		play_animation("up", 1)
		
	else:
		# if last key pressed is up keep that position
		if (prevUpKeyPressed):
			play_animation("up", 0)
		else:
			play_animation("down", 0)
		
		velocity.x = 0
		velocity.y = 0
	
	
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
			
	elif direction == "left":
		animation.flip_h = true
		
		if (movement == 0):
			animation.play("idle_side")
		
		if (movement == 1):
			animation.play("walking_side")
			
		if (movement == 2):
			animation.play("running_side_left")
			
	elif direction == "down":
		if (movement == 0):
			animation.play("idle_front")
		
		if (movement == 1):
			animation.play("walking_front")
			
		if (movement == 2):
			animation.play("running_front")
			
	elif direction == "up":
		if (movement == 0):
			animation.play("idle_back")
		
		if (movement == 1):
			animation.play("walking_back")
		
		if (movement == 2):
			animation.play("running_back")
