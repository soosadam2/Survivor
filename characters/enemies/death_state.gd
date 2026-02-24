class_name DeathState
extends LimboState

@export var death_anim : StringName = "death"

var _animation_player : AnimationPlayer

func _setup() -> void:
	_animation_player = blackboard.get_var("animation_player")

func _enter() -> void:
	agent.stats.alive = false
	
	_animation_player.play(death_anim)

func finished():
	agent.queue_free()
