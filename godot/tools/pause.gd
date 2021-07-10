extends Node

func _input(event):
	if event.is_action_pressed("ui_pause"):
		get_tree().paused = not get_tree().paused
