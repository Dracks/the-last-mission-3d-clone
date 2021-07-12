extends KinematicBody

class_name EnemyBase

export var points: int = 1
onready var gc: GameControllerSrc = get_node("/root/GameController")

func damage():
	gc.inc_points(points)
	queue_free()

