extends CharacterBody2D

@export var speed: float = 100.0
@export var jump_velocity: float = -350.0
@export var gravity: float = 800.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Jump
		if Input.is_action_just_pressed("up1"):
			velocity.y = jump_velocity

	var direction = Input.get_axis("left1", "right1")

	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# Left/right movement
	velocity.x = 0.0
	if Input.is_action_pressed("left1"):
		velocity.x -= speed
	if Input.is_action_pressed("right1"):
		velocity.x += speed

	# Move the character
	move_and_slide()
