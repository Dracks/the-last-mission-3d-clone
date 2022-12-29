extends Node

class_name EnemyMovement

export var velocity: float = 10

onready var enemy_base = get_parent()
onready var destination: Vector3 = enemy_base.translation

func _physics_process(delta):
	var advance = delta*velocity
	var advance_square = advance*advance
	if enemy_base.translation.distance_squared_to(destination) < advance_square:
		destination = get_next()
	var direction = enemy_base.translation.direction_to(destination)
	var collision = enemy_base.move_and_collide(direction*advance)
	if collision:
		if collision.collider.has_method('damage'):
			collision.collider.damage()
		elif collision.collider.has_method('reverse_damage'):
			collision.collider.reverse_damage(enemy_base)
			
func get_next():
	return Vector3.ZERO
