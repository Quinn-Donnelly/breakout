class_name Velocity 
extends Node

## Speed at which ball will be launched
@export var initialHitSpeed: float
var velocity: Vector2 = Vector2(0,0)
var hasHit: bool = false

func _ready() -> void:
	get_parent().set_meta(Constants.VELOCITY_COMPONENT, self)
	EventBus.initial_hit.connect(self.initial_hit)

func _physics_process(delta: float) -> void:
	get_parent().position.y += velocity.y * delta
	get_parent().position.x += velocity.x * delta

func initial_hit() -> void:
	velocity += Vector2(0, -1 * initialHitSpeed)
