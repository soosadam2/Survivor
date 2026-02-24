## Creates projectiles when the timer times out
class_name Weapon2D
extends Node2D

@export var level : int = 1
@export var definition : WeaponDefinition

var timer : Timer

const PROJECTILES_GROUP : StringName = "Projectiles"

var _projectiles_parent : Node

func _ready() -> void:
	assert(definition != null, "No weapon definition set.")
	_projectiles_parent = get_tree().get_first_node_in_group(PROJECTILES_GROUP)
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.start(definition.get_cooldown(level))

## Creates projectile instance(s) for the weapon in the game world
func cast(p_direction : Vector2) -> void:
	var projectile : Projectile = definition.get_scene(level).instantiate()
	projectile.launch(p_direction)
	_projectiles_parent.add_child(projectile)
	projectile.global_position = global_position

func _on_timer_timeout() -> void:
	cast(Vector2.RIGHT)
	
