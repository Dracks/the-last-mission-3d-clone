extends Node

class_name GameControllerSrc

var points: int = 0
var lifes: int = 10
var energy: float = 1000.0
var is_body_destroyed: bool = true
var tank_body_instance: TankBody

var restart_coordinates : Vector3
var initial_restart_coordinates: Vector3

onready var world : LastMissionWorld

var body_scene= preload('res://tank/body.tscn')
var head_scene = preload('res://tank/head.tscn')

var ui_control: UIControl setget ui_control_set, ui_control_get


func ui_control_set(new_ui: UIControl):
	new_ui.connect("restart_game", self, "restart_game")
	ui_control=new_ui
	
func ui_control_get():
	return ui_control

func _ready():
	initial_values()
	
func initial_values():
	points=0
	lifes=1
	energy=1000

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
		ui_control.show_game_over()
	else:
		tank_body_instance.damage()
		instantiate_head()

func inc_points(add_points: int):
	points += add_points
	ui_control.set_points(points)
	
func dec_energy(_energy: float):
	energy = energy -_energy
	ui_control.set_battery(energy)
	
func set_restart_coords(coords: Vector3):
	self.restart_coordinates = coords
	
func set_initial_restart_coords(coords: Vector3):
	self.initial_restart_coordinates = coords
	
func restart_game():
	initial_values()
	instantiate_head()
	
