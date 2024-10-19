extends CharacterBody2D

# Speed at which the character moves
const speed = 200
@onready var sprite_2d: Sprite2D = $Sprite2D

func _physics_process(_delta):
	var char_velocity = Vector2.ZERO

	# Capture input for horizontal and vertical movement
	if Input.is_action_pressed("ui_right"):
		char_velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		char_velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		char_velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		char_velocity.y -= 1

	# Normalize velocity to maintain consistent speed in diagonal movement
	if char_velocity.length() > 0:
		char_velocity = char_velocity.normalized() * speed

	# Move the character using the move_and_slide function
	char_velocity = move_and_slide()
