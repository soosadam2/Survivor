class_name Player
extends CharacterBody2D

@export var display_name : StringName = &"player_name"
@export var speed : float = 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector(&"left", &"right", &"up", &"down")
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2(
			move_toward(velocity.x, 0, speed),
			move_toward(velocity.y, 0, speed)
		)
	
	move_and_slide()
	
