class_name Level
extends Node

@export var initialBall: Ball
@export var tiles: Node
var levelRunning: bool = false

func _ready() -> void:
	EventBus.initial_hit.connect(self._start_level)
	tiles.child_exiting_tree.connect(self._on_tile_destroyed)
	EventBus.no_balls.connect(self._on_no_balls)

func _start_level() -> void:
	levelRunning = true
	var movement: Movement = initialBall.get_meta(Constants.MOVEMENT_COMPONENT)
	if movement == null:
		push_warning("ball doesn't have movement components")
	
	movement.initial_hit()

func _on_tile_destroyed(_node: Node) -> void: 
	if tiles.get_child_count() == 1 and levelRunning:
		levelRunning = false
		EventBus.level_complete.emit(EventBus.LEVEL_OUTCOME.LEVEL_WON)

func _on_no_balls() -> void:
	if levelRunning:
		levelRunning = false
		EventBus.level_complete.emit(EventBus.LEVEL_OUTCOME.LEVEL_LOST)
