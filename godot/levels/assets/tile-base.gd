extends StaticBody

export(float) var width
export(float) var height

func _ready():
	var box: BoxShape = $CollisionShape.shape
	width = box.extents.x*2
	height = box.extents.y*2
