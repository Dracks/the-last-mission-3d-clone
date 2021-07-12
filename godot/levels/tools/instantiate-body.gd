extends Spatial

class_name InstantiateBody

var gc: GameControllerSrc
func _ready():
	gc = get_node('/root/GameController')
	
func init():
	if gc.is_body_destroyed:
		gc.instantiate_body(to_global(Vector3.ZERO))
