class_name HurtBox2D
extends Area2D

@export var stat_controller : StatController

func _ready() -> void:
	assert(stat_controller != null, "Hurtbox needs a StatController reference to effect it's stats")

## Deals exactly the damage passed in to the hurtbox's stats object and
## emits signals as needed
func try_deal_damage(p_damage : int) -> bool:
	if not stat_controller.can_be_hit():
		return false
	
	var new_hp = stat_controller.hp - p_damage 
	stat_controller.hp = new_hp
	return true
