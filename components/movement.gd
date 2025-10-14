class_name Movement
extends Node

## Speed at which ball will be launched
@export var speed: float
var velocity: Vector2 = Vector2(0,0)
var hasHit: bool = false

func _ready() -> void:
	get_parent().set_meta(Constants.MOVEMENT_COMPONENT, self)
	EventBus.initial_hit.connect(self.initial_hit)

func _physics_process(delta: float) -> void:
	get_parent().position += velocity * delta

	if get_parent().global_position.x < 0 or get_parent().global_position.x > get_viewport().get_visible_rect().size.x:
		velocity.x = -velocity.x
	if get_parent().global_position.y < 0:
		velocity.y = -velocity.y

func initial_hit() -> void:
	velocity += Vector2(0, -1 * speed)

func bounceCollision(normal: Vector2) -> void:
	velocity = velocity.bounce(normal)
