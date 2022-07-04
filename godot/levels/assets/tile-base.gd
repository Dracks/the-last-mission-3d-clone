tool
extends Spatial

class_name TileBase

export(float) var width
export(float) var height

func _ready():
	var box: CSGBox = $Box
	width = box.width
	height = box.height
	print(width, height)
