class_name Breakable
extends Node

## Time hit to cause deletion
@export var hits: int

func _check_death() -> void:
	if hits <= 0:
		get_parent().queue_free()

func _ready() -> void:
	get_parent().set_meta(Constants.BREAKABLE_COMPONENT, self)

func hit(amount: int) -> void:
	hits -= amount
	_check_death()
