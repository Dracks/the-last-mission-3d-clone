extends Node

class_name CiclicMovement

var position_list:= PoolVector3Array()
var next_destination:=0

func _ready():
	for child in get_children():
		position_list.append(child.to_global(Vector3.ZERO))

func get_next()->Vector3:
	var destination = position_list[next_destination]
	next_destination += 1
	if next_destination >= position_list.size():
		next_destination = 0
	return destination
