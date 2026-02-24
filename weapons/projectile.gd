class_name Projectile
extends Node2D

## The areas that the projectile can interact on hit from
@export var hit_boxes : Array[HitBox2D]

@export var speed : float = 100.0

var direction : Vector2

func _ready() -> void:
	assert(direction != Vector2.ZERO, "Call launch to set direction of projectile before adding it as a child.")
	assert(hit_boxes.is_empty() == false, "Needs at least one hitbox to hit a target.")
	
	for box in hit_boxes:
		box.hit.connect(_on_hitbox_hit)
	
	await get_tree().create_timer(1.0).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	var move : Vector2 = direction * speed * delta
	translate(move)
	

func launch(p_direction : Vector2) -> void:
	direction = p_direction
	
func _on_hitbox_hit(p_hurtbox : HurtBox2D) -> void:
	## TODO Damage calculation
	var final_damage : int = 100
	
	p_hurtbox.try_deal_damage(final_damage)
