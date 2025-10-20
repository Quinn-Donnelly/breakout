class_name Bounce
extends Node

var area: Area2D
var movement: Movement

@export var curve: Curve

func _ready() -> void:
	area = get_parent()
	area.area_entered.connect(self._bounce)
	area.body_entered.connect(self._bounce)
	movement = get_parent().get_meta(Constants.MOVEMENT_COMPONENT)
	if movement == null:
		push_warning("movement component null on bounce parent")

func _bounce(body: Node2D) -> void:
	_bounceCollision(area, body)

func _bounceCollision(object: Node2D, collidedWith: Node2D) -> void:
	var offset: float
	var velocity: Vector2 = movement.getVelocity()

	if collidedWith is Player: 
		var shapeComponent: CollisionShape = collidedWith.get_meta(Constants.COLLISION_SHAPE_COMPONENT)
		if shapeComponent == null:
			push_warning("collided with player without shape components")
			return
		var halfWidth: float  = shapeComponent.shape.extents.x
		offset = (clampf((object.global_position.x - collidedWith.global_position.x) / halfWidth, -1, 1) + 1) / 2
		var offsetMult: float = curve.sample(offset)
		velocity.x = offsetMult * movement.h_speed

	velocity = velocity.bounce(Vector2.UP)
	movement.call_deferred("setVelocity", velocity)
