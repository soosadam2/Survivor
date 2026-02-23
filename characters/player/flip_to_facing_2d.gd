class_name FlipToFacing2D
extends Node2D

@export var input : PlayerInput

func _ready() -> void:
	assert(input != null, "In order to flip, reference to the PlayerInput is required.")
	input.facing_changed.connect(_on_facing_changed)
	
func _on_facing_changed(p_facing : Vector2) -> void:
	if p_facing.x > 0:
		scale.x = abs(scale.x)
	elif p_facing.x < 0:
		scale.x = -1 * abs(scale.x)
