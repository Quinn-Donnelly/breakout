class_name CollisionShape
extends CollisionShape2D

func _ready() -> void:
	get_parent().set_meta(Constants.COLLISION_SHAPE_COMPONENT, self) 
