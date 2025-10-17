class_name Ball
extends Node

var id: int = 0

func _init() -> void:
	id = get_instance_id()

func _exit_tree() -> void:
	EventBus.ball_destroyed.emit(id)

func _enter_tree() -> void:
	EventBus.ball_added.emit(id)
