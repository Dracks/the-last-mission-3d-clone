extends Spatial

class_name LastMissionWorld

export var camera_diff : float = 55

func _on_Turret_shot(bullet: PackedScene, translation: Vector3, looking_right:bool):
	var new_bullet : KinematicBody = bullet.instance()
	add_child(new_bullet)
	new_bullet.looking_right = looking_right
	new_bullet.set_translation(to_local(translation))
	
func next():
	$Camera.translate(Vector3(camera_diff, 0, 0))

func prev():
	$Camera.translate(Vector3(-camera_diff, 0 ,0))
	
