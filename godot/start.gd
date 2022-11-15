extends Control


const FILE_NAME="res://start.json"

var worldScene = preload("res://game/world.tscn")
var main = preload("res://menus/main.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var doFileExists = FileAccess.file_exists(FILE_NAME)
	if doFileExists:
		var file := FileAccess.open(FILE_NAME, FileAccess.READ)
		if file.get_error():
			print("Error ({}) loading start.json".format(file.get_error()))
			start_default()
		else:
			var test_json_conv = JSON.new()
			var error = test_json_conv.parse(file.get_as_text())
			var config :Dictionary= test_json_conv.get_data()
			if error:
				print("Error {} parsing start.json: \n{}\n{}".format([error, config.error_string, config.error_line]))
				start_default()
			else:
				execute_data(config)
	else:
		start_default()


func execute_data(config: Dictionary):
	print(config)
	var startConfig: String = config.get('start', 'default')
	if startConfig == 'game':
		start_game(config.get('init', {}))
	elif startConfig == 'default':
		start_default()
	else:
		print("Not valid configuration, starting with default")
		start_default()


func start_default():
	var error = get_tree().change_scene_to_packed(main)
	if error:
		print('Error ({}) loading main scene'.format(error))
		
func start_game(data: Dictionary):
	var game_controller : GameController = get_node("/root/GameController")
	game_controller.initial_lifes = data.get('lifes', game_controller.initial_lifes)
	game_controller.initial_points = data.get('points', game_controller.initial_points)
	game_controller.initial_energy = data.get('energy', game_controller.initial_energy)
	game_controller.initial_values()
	var error = get_tree().call_deferred("change_scene_to_packed", worldScene)
	if error:
		print('Error ({}) loading main scene'.format(error))
