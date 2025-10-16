@tool
class_name SceneManager
extends Node

## Levels in order to load
@export var levels: Array[PackedScene]
var currentSceneIndex: int = 0
var levelLoaded: bool = false

func load_next_level() -> void:
	if levelLoaded:
		currentSceneIndex += 1	
	
	if currentSceneIndex >= levels.size():
		return

	levelLoaded = true
	get_tree().change_scene_to_packed(levels[currentSceneIndex])
