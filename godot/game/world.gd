extends Node3D

class_name LastMissionWorld

@export var camera_diff : float = 55

var current_camera = 0


func _ready():
	var game_controller = get_node("/root/GameController")
	game_controller.world = self
	game_controller.ui_control = $Control
	
func _input(event):
	var camera_list : Array = get_tree().get_nodes_in_group('camera')
	if event.is_action_pressed("ui_select"):
		current_camera = current_camera+1
	
	current_camera = current_camera % camera_list.size()
	for camera in camera_list:
		camera.current=false
	
	camera_list[current_camera].current = true
	

func _on_Head_shot(bullet: CharacterBody3D, position: Vector3, looking_right:bool):
	# var new_bullet : CharacterBody3D = bullet.instantiate()
	add_child(bullet)
	bullet.looking_right = looking_right
	bullet.set_position(to_local(position))


func _on_main_menu_pressed():
	pass # Replace with function body.
