class_name Movement
extends Node

## Vertical movement speed 
@export var v_speed: float
## Horiziontal movement speed
@export var h_speed: float
var _velocity: Vector2 = Vector2(0.0,0.0)
var hasHit: bool = false

func _ready() -> void:
	get_parent().set_meta(Constants.MOVEMENT_COMPONENT, self)
	EventBus.initial_hit.connect(self.initial_hit)

func _physics_process(delta: float) -> void:
	get_parent().global_position += _velocity * delta

	if get_parent().global_position.x < 0 or get_parent().global_position.x > get_viewport().get_visible_rect().size.x:
		_velocity.x = -_velocity.x
	if get_parent().global_position.y < 0:
		_velocity.y = -_velocity.y

func initial_hit() -> void:
	_velocity = Vector2(0, -1 * v_speed)

func getVelocity() -> Vector2:
	return _velocity

func setVelocity(vel: Vector2) -> void: 
	var normVel = vel.normalized()
	_velocity.y = normVel.y * v_speed
	_velocity.x = normVel.x * h_speed
