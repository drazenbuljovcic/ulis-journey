extends CharacterBody2D

#
# Ordering
# z index = 1
# y sort enabled
#
#
# 

const speed = 80
 
func _ready():
	$UlisAnimation.play("idle_front")

func _physics_process(delta):
	process_player_movement(delta)
	

func process_player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):

		velocity.x = speed
		velocity.y = 0
		play_animation("right", 1)
	elif Input.is_action_pressed("ui_left"):

		velocity.x = -speed
		velocity.y = 0
		play_animation("left", 1)
	elif Input.is_action_pressed("ui_down"):

		velocity.x = 0
		velocity.y = speed
		play_animation("down", 1)
	elif Input.is_action_pressed("ui_up"):

		velocity.x = 0
		velocity.y = -speed
		play_animation("up", 1)
	else:
		play_animation("up", 0)
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
			
	elif direction == "left":
		animation.flip_h = true
		
		if (movement == 0):
			animation.play("idle_side")
		
		if (movement == 1):
			animation.play("walking_side")
			
			
	elif direction == "down":

		
		if (movement == 0):
			animation.play("idle_front")
		
		if (movement == 1):
			animation.play("walking_front")
			
	elif direction == "up":

		
		if (movement == 0):
			animation.play("idle_back")
		
		if (movement == 1):
			animation.play("walking_back")
