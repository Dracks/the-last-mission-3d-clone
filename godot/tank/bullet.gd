extends CharacterBody3D

var distance: float = 0;
@export var distance_range: float = 60;
@export var speed: float = 30;

var looking_right : bool :
	get:
		return looking_right # TODOConverter40 Non existent get function 
	set(mod_value):
		mod_value  # TODOConverter40 Copy here content of set_looking_right

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
		
		if collision.collider.has_method('damage'):
			print("Has damage!")
			collision.collider.damage()
		else: 
			print("No No!")
		get_parent().remove_child(self)
	elif distance > distance_range:
		get_parent().remove_child(self)


func reverse_damage(obj):
	obj.damage()
	get_parent().remove_child(self)
