extends KinematicBody

class_name EnemyBase

export var points: int = 1
export var velocity: float = 10

onready var gc: GameControllerSrc = get_node("/root/GameController")

onready var destination: Vector3 = translation

func damage():
	gc.inc_points(points)
	$ExplosionSound.play()
	queue_free()

func _physics_process(delta):
	var advance = delta*velocity
	var advance_square = advance*advance
	if translation.distance_squared_to(destination) < advance_square:
		destination = $Movement.get_next()
	var direction = translation.direction_to(destination)
	var collision = move_and_collide(direction*advance)
	if collision:
		if collision.collider.has_method('damage'):
			collision.collider.damage()
