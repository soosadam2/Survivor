class_name EnemyHSM
extends LimboHSM

@export var npc : NPC
@export var chase_state : LimboState
@export var death_state : LimboState

const DEATH_EVENT : StringName = &"death"

func _ready() -> void:
	assert(npc != null, "NPC Agent must be set on the HSM")
	_setup_hsm()
	npc.stats.alive_changed.connect(_on_npc_alive_changed)
	
func _setup_hsm() -> void:
	initialize(npc)
	_setup_transitions()
	set_active(true)
	
func _setup_transitions() -> void:
	add_transition(chase_state, death_state, DEATH_EVENT)

func _on_npc_alive_changed(p_alive : bool) -> void:
	if p_alive == false:
		dispatch(DEATH_EVENT)
