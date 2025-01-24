extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
@onready var idle: AnimatedSprite2D = $Idle

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction and handle movement/deceleration
	var direction := Input.get_axis("move_left", "move_right")
	if direction>0:
		idle.flip_h=false
	elif direction<0:
		idle.flip_h=true
		
		if direction==0:
			idle.play("idle")
		else:
			idle.play("run")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move and slide
	move_and_slide()
