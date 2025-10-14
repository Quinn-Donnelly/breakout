class_name Bounce
extends Node

var area: Area2D
var movement: Movement

func _ready() -> void:
	area = get_parent()
	area.area_entered.connect(self._bounce)
	movement = get_parent().get_meta(Constants.MOVEMENT_COMPONENT)

func _bounce(body: Node2D) -> void:
	movement.bounceCollision(area, body)
