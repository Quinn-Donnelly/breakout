@tool
class_name SceneManager
extends Node

## Levels in order to load
@export var levels: Array[PackedScene]
@onready var sceneTransitionTimer: Timer = $SceneTransitionTimer
var currentSceneIndex: int = 0
var levelLoaded: bool = false

func _ready() -> void:
	EventBus.level_complete.connect(self._on_level_complete)
	sceneTransitionTimer.timeout.connect(self._on_scene_transition_timer_timeout)

func load_next_level() -> void:
	if levelLoaded:
		currentSceneIndex += 1	
	
	if currentSceneIndex >= levels.size():
		return

	levelLoaded = true
	get_tree().change_scene_to_packed(levels[currentSceneIndex])

func _on_level_complete() -> void:
	sceneTransitionTimer.start()	

func _on_scene_transition_timer_timeout() -> void:
	load_next_level()
