extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventKey and event.pressed:
		start_new_game()
		

func start_new_game():
	var error = get_tree().call_deferred("change_scene_to_file", 'res://game/world.tscn')
	if error:
		print('Error ({}) loading main scene'.format(error))
