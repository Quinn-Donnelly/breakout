class_name KillBox
extends Area2D

func _ready() -> void:
	area_entered.connect(self._on_area_entered)

func _on_area_entered(area: Node2D) -> void:
	area.queue_free()
