extends CharacterBody2D

# Speed of the player
var speed = 200
var screen_size 
func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var char_velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		char_velocity.x += 1
	if Input.is_action_pressed("move_left"):
		char_velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		char_velocity.y += 1
	if Input.is_action_pressed("move_up"):
		char_velocity.y -= 1

	if char_velocity.length() > 0:
		char_velocity = char_velocity.normalized() * speed
#		$AnimatedSprite2D.play()
#	else:
#		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
