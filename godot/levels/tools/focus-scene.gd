extends Area

signal on_focus
signal on_tank_body_in
signal on_tank_body_out

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
		shape.set_extents( Vector3(screen_width-3.5, 14, 1))

func _on_FocusScene_body_entered(body):
	if body.is_in_group("tank_body"):
		emit_signal('on_tank_body_in')
	if body.is_in_group("head"):
		emit_signal("on_focus")
		var origin = main_camera.translation
		var global = to_global(Vector3.ZERO)
		main_camera.set_translation(Vector3(global.x, global.y, origin.z))


func _on_FocusScene_body_exited(body):
	if body.is_in_group("tank_body"):
		emit_signal('on_tank_body_out')
