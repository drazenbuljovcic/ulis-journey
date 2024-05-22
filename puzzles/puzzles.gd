extends Control

var tween : Tween

@onready var colorRect : ColorRect = $ColorRect

func _on_move_pressed() -> void:
	tween = create_tween() # Creates a new tween
	
	# Change position.x to 512 over 2 seconds:
	tween.tween_property(colorRect, "position:x", 512, 2.0)
	
	# After the first tween completed, the second will execute:
	tween.tween_property(colorRect, "position:x", 320, 1.0)
	
func _on_move_bounce_pressed() -> void:
	tween = create_tween()
	
	# Change position x to 512 over 2 seconds
	# Also add a bounce at the end of the transition:
	tween.tween_property(colorRect, "position:x", 512, 2.0).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.tween_property(colorRect, "position:x", 320, 1.0)

func _on_scale_pressed() -> void:
	tween = create_tween()
	
	# Double the scale over 2 seconds:
	tween.tween_property(colorRect, "scale", Vector2(2.0,2.0), 2.0)
	tween.tween_property(colorRect, "scale", Vector2(1.0,1.0), 1.0)
	
func _on_rotate_pressed() -> void:
	tween = create_tween().set_loops(2) # loop the tween 2 times
	
	# Rotate for 90 degrees over 1 second
	# will rotate 2 times because of the loop:
	tween.tween_property(colorRect, "rotation_degrees", 90, 1.0)
	tween.tween_interval(1) # wait for 1 second before continuing
	tween.tween_property(colorRect, "rotation_degrees", -90, 1.0)
	tween.tween_interval(1) # wait for 1 second before repeating
	
func _on_move_scale_pressed() -> void:
	tween = create_tween().set_parallel(true) # tweens will transition at the same time
	
	# Change position.x to 512 and also
	# change the scale simultaneously:
	tween.tween_property(colorRect, "position:x", 512, 2.0)
	tween.tween_property(colorRect, "scale", Vector2(2.0,2.0), 2.0)
	
	# You can use chain() to execute this tween afterward:
	tween.chain().tween_property(colorRect, "position:x", 320, 1.0)
	
	# And use parallel() to execute this tween simultaneously to the previous one:
	tween.parallel().tween_property(colorRect, "scale", Vector2(1.0,1.0), 1.0)

func _on_red_pressed() -> void:
	tween = create_tween()
	
	# Use set_delay() to delay the execution of a tween:
	tween.tween_property(colorRect, "color", Color.RED, 1.0).set_delay(1.0)
	tween.tween_property(colorRect, "color", Color.WHITE, 1.0)

func _on_transparent_pressed() -> void:
	tween = create_tween()
	
	# You can access specific properties like so:
	tween.tween_property(colorRect, "modulate:a", 0.0, 2.0)
	tween.tween_property(colorRect, "modulate:a", 1.0, 1.0)

func _on_blue_pressed() -> void:
	tween = create_tween()
	
	# with callback you can call any function:
	#tween.tween_callback(_set_blue)
	tween.tween_property(colorRect, "color", Color.WHITE, 1.0).set_delay(1.0) # Replace with function body.

func _on_green_pressed() -> void:
	# 1
	colorRect.color = Color.BLUE
	
	# 2
	#  A similar approach is to call tween_method().
	# tween = create_tween()
	#  here the function is called repeatedly over a time period
	# tween.tween_method(_set_green, Color.WHITE, Color.GREEN, 2.0)
	# tween.tween_property(colorRect, "color", Color.WHITE, 1.0).set_delay(1.0)
	#
