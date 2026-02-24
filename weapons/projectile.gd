class_name Projectile
extends Node2D

@export var speed : float = 100.0

var direction : Vector2

func _ready() -> void:
	assert(direction != Vector2.ZERO, "Call launch to set direction of projectile before adding it as a child.")
	await get_tree().create_timer(1.0).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	var move : Vector2 = direction * speed * delta
	translate(move)
	

func launch(p_direction : Vector2) -> void:
	direction = p_direction
	
