class_name Breakable
extends Node

# How many hits to break
@export var hits: int

func _check_death() -> void:
	if hits <= 0:
		get_parent().queue_free()

func _ready() -> void:
	get_parent().set_meta(Constants.BREAKABLE_COMPONENT, self)

func hit(amount: int) -> void:
	print("ow you hit me for %d" % amount)
	hits -= amount
	_check_death()
