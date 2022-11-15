class_name UIControl
extends Control

signal restart_game

func _ready():
	set_points(0)
	set_lifes(10)
	set_battery(1000.0)
	
	$GameOver.hide()
	
func _input(event: InputEvent):
	if event.is_action('ui_screenshot') and event.is_pressed():
		make_screenshot()

func set_points(points: int):
	$Panel/Score.text = "Score: "+str(points)

func set_lifes(lifes: int):
	$Panel/Lifes.text = "Lifes: "+str(lifes)
	
func set_battery(battery: float):
	$Panel/Battery.text = "Battery: "+str(battery)
	
func show_game_over():
	$GameOver.show()

func _on_restart_pressed():
	emit_signal('restart_game')
	$GameOver.hide()


func _on_main_menu_pressed():
	var error = get_tree().change_scene_to_file('res://menus/main.tscn')
	if error:
		print('Error ({}) loading main scene'.format(error))
		
func make_screenshot():
	get_viewport().set_clear_mode(SubViewport.CLEAR_MODE_ONCE)
	await get_tree().idle_frame
	await get_tree().idle_frame
	var image = get_viewport().get_texture().get_data()
	image.flip_y()

	image.save_png("screenshot_%s.png" % [Time.get_unix_time_from_system()])
