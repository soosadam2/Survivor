class_name MoveState
extends LimboState

##Animation to play when the player is Idling
@export var idle_anim : StringName = &"idle"

##Animation to play when the player is Running
@export var run_anim : StringName = &"run"
var _animation_player : AnimationPlayer

func _setup() -> void:
	_animation_player = blackboard.get_var("animation_player")
	
func _update(_delta: float) -> void:
	var direction : Vector2 = blackboard.get_var("direction")
	
	if direction:
		_animation_player.play(run_anim)
	else:
		_animation_player.play(idle_anim)

func _enter() -> void:
	_animation_player.play(idle_anim)
	
