extends Control


const FILE_NAME="res://start.json"

var worldScene = preload("res://game/world.tscn")
var main = preload("res://menus/main.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var f := File.new()
	var doFileExists = f.file_exists(FILE_NAME)
	if doFileExists:
		var err := f.open(FILE_NAME, f.READ)
		if err:
			print("Error ({}) loading start.json".format(err))
			start_default()
		else:
			var config := JSON.parse(f.get_as_text())
			if config.error:
				print("Error {} parsing start.json: \n{}\n{}".format([config.error, config.error_string, config.error_line]))
				start_default()
			else:
				execute_data(config.result)
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
	var error = get_tree().change_scene_to(main)
	if error:
		print('Error ({}) loading main scene'.format(error))
		
func start_game(data: Dictionary):
	var game_controller : GameController = get_node("/root/GameController")
	game_controller.initial_lifes = data.get('lifes', game_controller.initial_lifes)
	game_controller.initial_points = data.get('points', game_controller.initial_points)
	game_controller.initial_energy = data.get('energy', game_controller.initial_energy)
	game_controller.initial_values()
	var error = get_tree().call_deferred("change_scene_to", worldScene)
	if error:
		print('Error ({}) loading main scene'.format(error))
