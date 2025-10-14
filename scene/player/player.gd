class_name Player
extends Area2D

@export var speed: float

func _physics_process(delta: float) -> void:
	var vel = Vector2()
	if Input.is_action_pressed("move_left"):
		vel.x -= 1
	if Input.is_action_pressed("move_right"):
		vel.x += 1

	position += vel * speed * delta
	position.x = clampf(position.x, 0.0, 1152.0)

func _process(_delta: float) -> void:
	if Input.is_action_pressed("init_hit"):
		EventBus.initial_hit.emit()
