class_name Movement
extends Node

## Speed at which ball will be launched
@export var speed: float
## Speed for paddle offset horiziontal mult
@export var h_speed: float
var velocity: Vector2 = Vector2(0,0)
var hasHit: bool = false

func _ready() -> void:
	get_parent().set_meta(Constants.MOVEMENT_COMPONENT, self)
	EventBus.initial_hit.connect(self.initial_hit)

func _physics_process(delta: float) -> void:
	get_parent().global_position += velocity * delta

	if get_parent().global_position.x < 0 or get_parent().global_position.x > get_viewport().get_visible_rect().size.x:
		velocity.x = -velocity.x
	if get_parent().global_position.y < 0:
		velocity.y = -velocity.y

func initial_hit() -> void:
	velocity += Vector2(0, -1 * speed)

func bounceCollision(object: Node2D, collidedWith: Node2D) -> void:
	var offset: float
	if collidedWith.has_meta(Constants.COLLISION_SHAPE_COMPONENT):
		var shapeComponent: CollisionShape = collidedWith.get_meta(Constants.COLLISION_SHAPE_COMPONENT)
		var halfWidth: float  = shapeComponent.shape.extents.x
		offset = clampf((object.global_position.x - collidedWith.global_position.x) / halfWidth, -1, 1)

	velocity.x = offset * h_speed 
	velocity = velocity.bounce(Vector2.UP)
