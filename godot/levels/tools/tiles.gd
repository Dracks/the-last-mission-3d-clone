@tool
	
extends Node3D

@export var quantity:=3
@export var horizontal:=true

func _ready():
	var tile : TileBase = $Tile
	var offsetX = 0
	var offsetY = 0
	var baseShapeX = 0
	var baseShapeY = 0
	if horizontal:
		offsetX = tile.width
		baseShapeY = tile.height
	else:
		offsetY = tile.height
		baseShapeX = tile.width
	if not Engine.is_editor_hint():
		remove_child(tile)
	for i in range(quantity):
		var node = tile.duplicate()
		node.translate(Vector3(i*offsetX,i*offsetY,0))
		add_child(node) # Parent could be any node in the scene
	
	var boxShape : BoxShape3D = $Body/CollisionShape3D.shape
	boxShape.extents = Vector3(quantity*offsetX/2+baseShapeX, quantity*offsetY/2+baseShapeY, 3)
	$Body.position=Vector3(boxShape.extents.x-tile.width, boxShape.extents.y-tile.height, 0)


