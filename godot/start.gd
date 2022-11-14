extends Control


const FILE_NAME="res://start.json"


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
		start_game()
	elif startConfig == 'default':
		start_default()
	else:
		print("Not valid configuration, starting with default")
		start_default()


func start_default():
	var error = get_tree().change_scene('res://menus/main.tscn')
	if error:
		print('Error ({}) loading main scene'.format(error))
		
func start_game():
	var error = get_tree().call_deferred("change_scene", 'res://game/world.tscn')
	if error:
		print('Error ({}) loading main scene'.format(error))
