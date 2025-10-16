class_name Level
extends Node

@export var initialBall: Ball
@export var tiles: Node

func _ready() -> void:
	EventBus.initial_hit.connect(self._start_level)

func _start_level() -> void:
	var movement: Movement = initialBall.get_meta(Constants.MOVEMENT_COMPONENT)
	if movement == null:
		push_warning("ball doesn't have movement components")
	
	movement.initial_hit()

