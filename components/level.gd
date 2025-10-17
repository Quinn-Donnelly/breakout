class_name Level
extends Node

@export var initialBall: Ball
@export var tiles: Node

func _ready() -> void:
	EventBus.initial_hit.connect(self._start_level)
	tiles.child_exiting_tree.connect(self._on_tile_destroyed)

func _start_level() -> void:
	var movement: Movement = initialBall.get_meta(Constants.MOVEMENT_COMPONENT)
	if movement == null:
		push_warning("ball doesn't have movement components")
	
	movement.initial_hit()


func _on_tile_destroyed(_node: Node) -> void: 
	if tiles.get_child_count() == 1:
		EventBus.level_complete.emit()
