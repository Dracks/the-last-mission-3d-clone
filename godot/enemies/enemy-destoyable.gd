extends KinematicBody

class_name EnemyDestroyable

signal destroyed

export var points: int = 1

export(NodePath) var autoinstance_path: NodePath

onready var gc: GameControllerSrc = get_node("/root/GameController")

func _ready():
	if autoinstance_path and not autoinstance_path.is_empty():
		var autoinstance = get_node(autoinstance_path)
		autoinstance.add_enemy(self)

func damage():
	gc.inc_points(points)
	$ExplosionSound.play()
	emit_signal("destroyed")
	queue_free()
	
