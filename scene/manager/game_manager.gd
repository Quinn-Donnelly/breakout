extends Node

@onready var button: Button = $Button
@onready var sceneManager: SceneManager = $SceneManager
@onready var gameOverLabel: Label = $GameOver
@onready var gameWinLabel: Label = $GameWin

func _ready() -> void:
	button.pressed.connect(self._start_game)
	EventBus.level_complete.connect(self._level_complete)
	gameOverLabel.hide()
	gameWinLabel.hide()
	EventBus.round_complete.connect(self._round_complete)

func _start_game() -> void:
	gameOverLabel.hide()
	gameWinLabel.hide()
	sceneManager.load_next_level(false)
	button.hide()

func _level_complete(outcome: EventBus.LEVEL_OUTCOME) -> void:
	match outcome:
		EventBus.LEVEL_OUTCOME.LEVEL_LOST:
			_game_over()
		EventBus.LEVEL_OUTCOME.LEVEL_WON:
			sceneManager.load_next_level(true)
		_:
			push_error("Game Manager: Unknown level state: %s", outcome)

func _game_over() -> void:
	button.show()
	gameOverLabel.show()
	sceneManager.load_game_over()
	EventBus.reset.emit()

func _round_complete() -> void:
	button.show()
	gameWinLabel.show()
	sceneManager.load_game_win()
	EventBus.reset.emit()
