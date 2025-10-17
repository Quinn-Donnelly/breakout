extends Node

var ballInventory: Dictionary[int, int] = {}

func _ready() -> void:
	EventBus.ball_destroyed.connect(self._on_ball_destroyed)
	EventBus.ball_added.connect(self._on_ball_added)

func _on_ball_destroyed(id: int) -> void:
	ballInventory.erase(id)
	if ballInventory.size() <= 0:
		EventBus.no_balls.emit()

func _on_ball_added(id: int) -> void:
	ballInventory[id] = 0
