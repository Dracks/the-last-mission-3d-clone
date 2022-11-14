extends Control

signal restart_game

class_name UIControl

func _ready():
	set_points(0)
	set_lifes(10)
	set_battery(1000.0)
	
	$GameOver.hide()

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
	var error = get_tree().change_scene('res://menus/main.tscn')
	if error:
		print('Error ({}) loading main scene'.format(error))
