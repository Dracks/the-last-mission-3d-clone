extends Node

class_name GameControllerSrc

var points: int = 0
var is_body_destroyed: bool = true

onready var world = get_node('/root/World')

var body_scene= preload('res://tank/body.tscn')
onready var ui_control = get_node('/root/World/Control')


func instantiate_body(position: Vector3):
	var body = body_scene.instance()
	world.add_child(body)
	body.set_translation(position)
	is_body_destroyed = false
	
	
func inc_points(add_points: int):
	points += add_points
	ui_control.set_points(points)
	
