extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


onready var main_camera : Camera = get_viewport().get_camera() 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FocusScene_body_entered(body):
	var origin = main_camera.translation
	main_camera.set_translation(Vector3(translation.x, translation.y, origin.z))
