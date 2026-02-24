class_name StatController
extends Node

var hp : int = 100

var max_hp : int = 100:
	set(value):
		hp = min(value, max_hp)

var alive : bool = true

func can_be_hit() -> bool:
	return alive
