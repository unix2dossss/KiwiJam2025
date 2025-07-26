extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var gravity: float = 1000.0

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Jump
		if Input.is_action_just_pressed("up0"):
			velocity.y = jump_velocity

	# Left/right movement
	velocity.x = 0.0
	if Input.is_action_pressed("left0"):
		velocity.x -= speed
	if Input.is_action_pressed("right0"):
		velocity.x += speed

	# Move the character
	move_and_slide()
