@tool
extends Node

class_name Repeat


@export var number: int: int

func _ready():
	var child_node = get_child(0)
	remove_child(child_node)
	var parent = get_parent()
	for i in range(number):
		parent.call_deferred("add_child", child_node.duplicate())
	queue_free()
	parent.call_deferred('_ready')
	
