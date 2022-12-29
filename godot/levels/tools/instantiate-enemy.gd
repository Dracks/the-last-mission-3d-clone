extends Spatial

class_name InstantiateEnemy

class EnemyInfo:
	var enemy: EnemyDestroyable
	var deleted:=true
	var position: Vector3

var enemy_list:Array=[]

func add_enemy(enemy: EnemyDestroyable):
	var parent = enemy.get_parent()
	parent.remove_child(enemy)
	enemy.autoinstance_path=NodePath()
	var enemy_info = EnemyInfo.new()
	enemy_info.enemy=enemy.duplicate()
	enemy_info.position = enemy.to_global(Vector3.ZERO)
	enemy_list.push_back(enemy_info)

func on_enemy_destroyed(enemy_info: EnemyInfo):
	enemy_info.deleted = true
	
func init():
	for enemy_info in enemy_list:
		if enemy_info.deleted:
			var enemy = enemy_info.enemy.duplicate()
			enemy_info.deleted = false
			owner.add_child(enemy)
			enemy.set_translation(owner.to_local(enemy_info.position))
			enemy.connect("destroyed", self, "on_enemy_destroyed", [enemy_info])
