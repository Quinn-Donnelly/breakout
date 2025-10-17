@warning_ignore_start("unused_signal")
extends Node

## Game
signal reset

## LevelManager
signal round_complete

## Ball
signal initial_hit
signal ball_destroyed(id)
signal ball_added(id)

## Level
enum LEVEL_OUTCOME { LEVEL_LOST, LEVEL_WON }
signal level_complete(LEVEL_OUTCOME)
signal no_balls

@warning_ignore_restore("unused_signal")
