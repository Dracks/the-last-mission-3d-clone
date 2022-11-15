extends Node3D

class_name InstantiateBody

@export var is_active: bool = false

var gc: GameControllerSrc
func _ready():
	gc = get_node('/root/GameController')
	
func init():
	if gc.is_body_destroyed and self.is_active:
		gc.instantiate_body(to_global(Vector3.ZERO))
