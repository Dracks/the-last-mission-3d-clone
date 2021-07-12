extends Node

class_name GameControllerSrc

var points: int = 0
var is_body_destroyed: bool = true

onready var world = get_node('/root/World')

var bodyScene= preload('res://tank/body.tscn')


func instantiate_body(position: Vector3):
	var body = bodyScene.instance()
	world.add_child(body)
	body.set_translation(position)
	is_body_destroyed = false
	
	
func inc_points(add_points: int):
	points += add_points
