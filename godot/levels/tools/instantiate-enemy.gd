extends Node3D

class_name InstantiateEnemy

var enemy_base: EnemyBase
var enemy


func _ready():
	if get_child_count() ==1:
		enemy_base = get_child(0)
		remove_child(enemy_base)
	else:
		print("Please only one child per instantiate-enemy")
		
func init():
	if not is_instance_valid(enemy):
		enemy = enemy_base.duplicate()
	if not enemy.get_parent():
		owner.add_child(enemy)
	enemy.set_position(owner.to_local(to_global(Vector3.ZERO)))
