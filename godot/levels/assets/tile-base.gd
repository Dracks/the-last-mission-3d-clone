@tool
extends Node3D

class_name TileBase

@export var width: float
@export var height: float

func _ready():
	var box: CSGBox3D = $Box
	width = box.size.x
	height = box.size.y
