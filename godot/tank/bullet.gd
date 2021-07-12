extends KinematicBody

var distance: float = 0;
export var distance_range: float = 60;
export var speed: float = 30;

var looking_right : bool setget set_looking_right

func set_looking_right(b: bool):

	looking_right = b
	if not b:
		speed = -speed
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var advance = speed * delta
	var collision = move_and_collide(Vector3.RIGHT*advance)
	distance += advance
	if collision:
		var debug = range(0,6)
		
		if collision.collider.has_method('damage'):
			print("Has damage!")
			collision.collider.damage()
		else: 
			print("No No!")
		get_parent().remove_child(self)
	elif distance > distance_range:
		get_parent().remove_child(self)
