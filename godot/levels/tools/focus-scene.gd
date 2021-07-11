extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var screen_width : float = 26 setget set_screen_width
var shape : BoxShape 

func set_screen_width(new_width: float):
	screen_width = new_width
	update_shape()

onready var main_camera : Camera = get_viewport().get_camera() 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	shape = $CollisionShape.shape
	update_shape()

func update_shape():
	if shape:
		shape.set_extents( Vector3(screen_width-3.5, 15, 1))

func _on_FocusScene_body_entered(body):
	var origin = main_camera.translation
	main_camera.set_translation(Vector3(translation.x, translation.y, origin.z))
