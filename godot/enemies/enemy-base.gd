extends CharacterBody3D

class_name EnemyBase

@export var points: int = 1
@export var vel: float = 10

@onready var gc: GameControllerSrc = get_node("/root/GameController")

@onready var destination: Vector3 = position

func damage():
	gc.inc_points(points)
	$ExplosionSound.play()
	queue_free()

func _physics_process(delta):
	var advance = delta*vel
	var advance_square = advance*advance
	if position.distance_squared_to(destination) < advance_square:
		destination = $Movement.get_next()
	var direction = position.direction_to(destination)
	var collision = move_and_collide(direction*advance)
	if collision:
		if collision.collider.has_method('damage'):
			collision.collider.damage()
		elif collision.collider.has_method('reverse_damage'):
			collision.collider.reverse_damage(self)
