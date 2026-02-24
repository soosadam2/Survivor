## Definition for weapon in the game which can spawn a projectile after a time elapses
class_name WeaponDefinition
extends Resource

## Display name for the weapon type
@export var name : StringName

## Default icon for representing the weapon type in the UI
@export var icon : Texture2D

func get_cooldown(_p_level : int) -> float:
	return 1.0

func get_scene(_p_level : int) -> PackedScene:
	return load("res://weapons/spear.tscn")
	
