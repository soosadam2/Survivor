## Runs towards the player wherever it is in the game
class_name ChaseState
extends LimboState

@export var chase_anim : StringName = "run"

var _animation_player : AnimationPlayer

func _setup() -> void:
	_animation_player = blackboard.get_var("animation_player")

func _enter() -> void:
	_animation_player.play(chase_anim)
