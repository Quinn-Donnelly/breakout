class_name ForwardMovement
extends Node

@export var speed: float

func _physics_process(delta: float) -> void:
	get_parent().position.y -= speed * delta
