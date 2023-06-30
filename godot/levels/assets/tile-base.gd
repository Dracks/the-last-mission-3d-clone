@tool
extends Node3D

class_name TileBase

@export var width: float
@export var height: float

func _ready():
	var box: CSGBox3D = $Box
	width = box.width
	height = box.height
