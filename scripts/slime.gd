extends Node2D

const SPEED = 60
var DIRECTION = 1

@onready var right: RayCast2D = $Right
@onready var left: RayCast2D = $Left
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _process(delta: float) -> void:
	# Check if the RayCasts detect collisions
	if right.is_colliding():
		DIRECTION = -1
		animated_sprite_2d.flip_h=true
	elif left.is_colliding():
		DIRECTION = 1
		animated_sprite_2d.flip_h=false

	# Update position
	position.x += DIRECTION * SPEED * delta
