extends Spatial

class_name LastMissionWorld

export var camera_diff : float = 55

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
	

func _on_Head_shot(bullet: KinematicBody, translation: Vector3, looking_right:bool):
	# var new_bullet : KinematicBody = bullet.instance()
	add_child(bullet)
	bullet.looking_right = looking_right
	bullet.set_translation(to_local(translation))


func _on_main_menu_pressed():
	pass # Replace with function body.
