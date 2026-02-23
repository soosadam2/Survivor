class_name Player
extends CharacterBody2D

@export var display_name : StringName = &"player_name"

## Base movement speed of the player character
@export var speed : float = 100.0

@export var input : PlayerInput

func _ready() -> void:
	assert(input != null, "Input must be assigned for the character body to move properly.")

func _physics_process(delta: float) -> void:
	var direction := input.direction 
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2(
			move_toward(velocity.x, 0, speed),
			move_toward(velocity.y, 0, speed)
		)
	
	move_and_slide()
	
