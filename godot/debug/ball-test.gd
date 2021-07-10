extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _process(delta):
	move_and_collide(Vector3.DOWN*delta*5)
