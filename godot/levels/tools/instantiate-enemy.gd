extends Node3D

class_name InstantiateEnemy

class EnemyInfo:
	var enemy: EnemyDestroyable
	var deleted:=true
	var position: Vector3

var enemy_list:Array=[]

func add_enemy(enemy: EnemyDestroyable):
	# await get_tree().idle_frame
	var parent = enemy.get_parent()
	enemy.autoinstance_path=NodePath()
	var enemy_info = EnemyInfo.new()
	enemy_info.enemy=enemy.duplicate()
	enemy_info.position = enemy.to_global(Vector3.ZERO)
	enemy_list.push_back(enemy_info)
	parent.remove_child.call_deferred(enemy)

func on_enemy_destroyed(enemy_info: EnemyInfo):
	enemy_info.deleted = true
	
func init():
	for enemy_info in enemy_list:
		if enemy_info.deleted:
			var enemy = enemy_info.enemy.duplicate()
			enemy_info.deleted = false
			owner.add_child(enemy)
			enemy.set_position(owner.to_local(enemy_info.position))
			enemy.connect("destroyed",Callable(self,"on_enemy_destroyed").bind(enemy_info))
