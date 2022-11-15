extends Node3D

class_name LastMissionWorld

@export var camera_diff : float = 55


func _ready():
	var game_controller = get_node("/root/GameController")
	game_controller.world = self
	game_controller.ui_control = $Control
	
func _input(event):
	if event.is_action_pressed("ui_select"):
		$Camera2.current = not $Camera2.current

func _on_Head_shot(bullet: CharacterBody3D, position: Vector3, looking_right:bool):
	# var new_bullet : CharacterBody3D = bullet.instantiate()
	add_child(bullet)
	bullet.looking_right = looking_right
	bullet.set_position(to_local(position))


func _on_main_menu_pressed():
	pass # Replace with function body.
