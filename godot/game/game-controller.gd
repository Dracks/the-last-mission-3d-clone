extends Node

class_name GameControllerSrc

var points: int = 0
var lifes: int = 10
var is_body_destroyed: bool = true
var tank_body_instance: TankBody

var restart_coordinates : Vector3

onready var world = get_node('/root/World')

var body_scene= preload('res://tank/body.tscn')
var head_scene = preload('res://tank/head.tscn')

onready var ui_control = get_node('/root/World/Control')

func instantiate_head():
	var head = head_scene.instance()
	world.add_child(head)
	head.add_to_group('head')
	head.set_translation(self.restart_coordinates)
	head.connect("life_lost", self, "life_lost")
	head.connect('shot', world, "_on_Head_shot")

func instantiate_body(position: Vector3):
	var body = body_scene.instance()
	body.add_to_group('tank_body')
	world.add_child(body)
	body.set_translation(position)
	tank_body_instance = body
	is_body_destroyed = false
	
func life_lost():
	lifes = lifes -1
	ui_control.set_lifes(lifes)
	if lifes==0:
		print("Game Over")
	else:
		tank_body_instance.damage()
		instantiate_head()

func inc_points(add_points: int):
	points += add_points
	ui_control.set_points(points)
	
func set_restart_coords(coords: Vector3):
	self.restart_coordinates = coords
