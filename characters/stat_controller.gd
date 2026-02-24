class_name StatController
extends Node

signal alive_changed(alive : bool)

var max_hp : int = 100

var hp : int = 100:
	set(value):
		hp = min(value, max_hp)
		alive = hp > 0

var alive : bool = true:
	set(value):
		if alive == value:
			return
		
		alive = value
		alive_changed.emit(alive)

func can_be_hit() -> bool:
	return alive
