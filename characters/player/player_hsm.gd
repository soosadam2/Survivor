class_name PlayerHSM
extends LimboHSM

@export var player : Player 

##The animation player that controls the player character's animations
@export var animation_player : AnimationPlayer

func _ready() -> void:
	assert(player != null, "Player Agent must be set on the HSM")
	_setup_hsm()
	
func _setup_hsm() -> void:
	initialize(player)
	set_active(true)
	
