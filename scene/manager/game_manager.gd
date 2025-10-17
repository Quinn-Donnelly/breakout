extends Node

var gameStart: bool = false
@onready var button: Button = $Button
@onready var sceneManager: SceneManager = $SceneManager


func _ready() -> void:
	button.pressed.connect(self._start_game)

func _start_game() -> void:
	sceneManager.load_next_level()
	button.hide()
