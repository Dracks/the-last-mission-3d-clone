tool

extends Spatial

class_name Horizontal
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var previous_offset: float = 0
	var offset: float=0
	var children_list = get_children()
	for child in children_list:
		if child.has_method("set_translation"):
			var new_offset : float = child.width
			offset = offset + new_offset + previous_offset
			previous_offset = new_offset
			child.set_translation(Vector3(offset, 0, 0))
			
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
