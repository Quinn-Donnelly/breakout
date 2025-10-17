@tool
class_name SceneManager
extends Node

## Levels in order to load
@export var levels: Array[PackedScene]
## Scene to load on game over
@export var gameOver: PackedScene = preload("res://scene/title/title.tscn")
@onready var sceneTransitionTimer: Timer = $SceneTransitionTimer
var currentSceneIndex: int = 0
var levelLoaded: bool = false

func _ready() -> void:
	sceneTransitionTimer.timeout.connect(self._on_scene_transition_timer_timeout)
	EventBus.reset.connect(self._reset)

func load_next_level(withDelay: bool) -> void:
	if withDelay:
		sceneTransitionTimer.start()
	else:
		_load_next_level()

func _load_next_level() -> void:
	if levelLoaded:
		currentSceneIndex += 1	
	
	if currentSceneIndex >= levels.size():
		EventBus.round_complete.emit()
		return

	levelLoaded = true
	get_tree().change_scene_to_packed(levels[currentSceneIndex])


func load_game_over() -> void:
	call_deferred("_load_game_title")

func load_game_win() -> void:
	call_deferred("_load_game_title")

func _load_game_title() -> void:
	get_tree().change_scene_to_packed(gameOver)

func _on_scene_transition_timer_timeout() -> void:
	load_next_level(false)

func _reset() -> void:
	currentSceneIndex = 0
	levelLoaded = false
