## Action handling logic for InputMap defined actions relevant
## to player character
class_name PlayerInput
extends Node

signal facing_changed(facing : Vector2)

## The direction that the character is trying to move
@export var direction := Vector2.ZERO

## The direction that the character is facing
var facing := Vector2.RIGHT :
	set(value):
		if facing == value:
			return
		
		facing = value
		facing_changed.emit(facing)

var left : StringName 	= &"left"
var right : StringName 	= &"right"
var up : StringName 	= &"up"
var down : StringName 	= &"down"

func _input(event: InputEvent) -> void:
	if _is_movement_action(event):
		var input : Vector2 = Input.get_vector(left, right,up, down)
		
		direction = input
		
		if input != Vector2.ZERO:
			facing = input
	
	pass

## Determine if the action is a movement input action
func _is_movement_action(event : InputEvent) -> bool:
	return event.is_action(left) or\
	event.is_action(right) or\
	event.is_action(up) or\
	event.is_action(down)
	
