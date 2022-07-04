tool
extends Node

class_name Repeat


export(int) var number: int

func _ready():
	var child_node = get_child(0)
	remove_child(child_node)
	var parent = get_parent()
	print(number)
	for i in range(number):
		parent.call_deferred("add_child", child_node.duplicate())
	queue_free()
	parent.call_deferred('_ready')
	
