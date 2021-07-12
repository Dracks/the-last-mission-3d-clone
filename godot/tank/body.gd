extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

class_name TankBody

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func damage()->void:
	get_node("/root/GameController").is_body_destroyed = true
	queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
