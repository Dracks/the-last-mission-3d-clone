extends Control



func _unhandled_input(event):
	print("Event", event)
	if event is InputEventKey and event.pressed:
		start_new_game()

func start_new_game():
	var error = get_tree().call_deferred("change_scene", 'res://game/world.tscn')
	if error:
		print('Error ({}) loading main scene'.format(error))
