extends Spatial

class_name Gun

onready var turret: KinematicBody = get_parent()
onready var world: Spatial = find_parent("World")

var is_shoting: bool = false
var next_shot_delay : float = 0
export(float) var max_delay: float = 0.2
var enabled: bool = true

export(PackedScene) var bullet
# var bullet = preload("res://tank/Bullet.tscn")

func _input(event: InputEvent):
	if event.is_action("ui_shot"):
		is_shoting = event.is_pressed()
	
func _process(delta: float):
	if next_shot_delay <= 0:
		if enabled and is_shoting:
			get_parent().emit_signal("shot", bullet, to_global(Vector3.ZERO), get_parent().looking_right)
			next_shot_delay = max_delay
	else:
		next_shot_delay = next_shot_delay - delta
