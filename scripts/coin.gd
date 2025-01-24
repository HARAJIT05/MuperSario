extends Area2D

@onready var gm: Node = %GM
@onready var animation_player: AnimationPlayer = $Coin/AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	gm.add_point()
	queue_free()
