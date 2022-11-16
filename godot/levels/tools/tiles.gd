tool
	
extends Spatial

export var quantity:=3
export var horizontal:=true

func _ready():
	var tile : TileBase = $Tile
	var offsetX = 0
	var offsetY = 0
	var baseShapeX = 0
	var baseShapeY = 0
	var sizeX = 0
	var sizeY = 0
	if horizontal:
		offsetX = tile.width
		sizeX = quantity*offsetX/2
		
		baseShapeY = tile.height/2
	else:
		offsetY = tile.height
		sizeY = quantity*offsetY/2
		
		baseShapeX = tile.width/2
	if not Engine.editor_hint:
		remove_child(tile)
	for i in range(quantity):
		var node = tile.duplicate()
		node.translate(Vector3(i*offsetX+offsetX/2,i*offsetY+offsetY/2,0))
		add_child(node) # Parent could be any node in the scene
	
	var boxShape : BoxShape = $Body/CollisionShape.shape
	boxShape.set_extents(Vector3(sizeX+baseShapeX, sizeY+baseShapeY, 3))

	$Body.translation=Vector3(sizeX, sizeY, 0)


