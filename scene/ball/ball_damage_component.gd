class_name BallDamage
extends Node

@export var area: Area2D

func _ready() -> void:
	area.area_entered.connect(self._deal_damage)

func _deal_damage(body: Area2D) -> void:
	if body.has_meta(Constants.BREAKABLE_COMPONENT):
		var component: Breakable = body.get_meta(Constants.BREAKABLE_COMPONENT)
		component.hit(1)
