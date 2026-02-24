## Detects when it comes in contact with a hurtbox and emits hurt_box_hit signal
class_name HitBox2D
extends Area2D

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(p_area : Area2D) -> void:
	if p_area is HurtBox2D:
		prints("%s hit %s at position %s" % [self, p_area, p_area.global_position])
