extends RigidBody

export var points: int = 1

export var height: float = 0.5

onready var gc: GameControllerSrc = get_node("/root/GameController")

func damage():
	gc.inc_points(points)
	$ExplosionSound.play()
	queue_free()
