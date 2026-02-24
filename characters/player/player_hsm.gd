class_name PlayerHSM
extends LimboHSM

@export var player : Player 

func _ready() -> void:
	assert(player != null, "Player Agent must be set on the HSM")
	_setup_hsm()
	
func _setup_hsm() -> void:
	initialize(player)
	set_active(true)
	
