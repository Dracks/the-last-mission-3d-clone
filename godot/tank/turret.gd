extends KinematicBody

signal shot(bullet, translation, point_at)

class_name Turret

var up: bool = false
var down: bool = false
var left: bool = false
var right: bool = false

var looking_right: bool = false
var looking_left: bool = false
var current_angle: float = 0

# velocity
export var v_rotate: float = PI*1.5
export var v_horizontal: float = 10
export var v_vertical: float = 10

var up_direction = Vector3(0, v_vertical, 0)
var forward = Vector3(v_horizontal, 0, 0)

onready var gun = get_node('Gun')

func _ready():
	rotate_logic(0)

func check(event: InputEvent, ui_action: String, current: bool) -> bool:
	if event.is_action(ui_action):
		return event.is_pressed()
	return current

func _input(event: InputEvent):
	up = check(event, 'ui_up', up)
	down = check(event, 'ui_down', down)
	left = check(event, 'ui_left', left)
	right = check(event, 'ui_right', right)

func _process(delta: float):
	if up or down:
		if up and not down:
			move_and_collide(up_direction*delta)
		elif down:
			move_and_collide(-2*delta*up_direction)
		else:
			move_and_collide(-delta*up_direction)
			pass
	else:
		move_and_collide(-delta*up_direction)
		pass
	
	if left or right:
		if left and not right:
			if not looking_left:
				rotate_logic(v_rotate*delta)
			else:
				move_and_collide(-forward*delta)
		elif right:
			if not looking_right:
				rotate_logic(-v_rotate*delta)
			else:
				move_and_collide(forward*delta)


func rotate_logic(angle: float)->void:
	gun.enabled = false
	looking_right = false
	looking_left = false

	current_angle += angle
	if current_angle > PI:
		current_angle = PI
		looking_left = true
		gun.enabled = true
	elif current_angle < 0:
		current_angle = 0
		looking_right = true
		gun.enabled = true

	set_rotation(Vector3(0, -current_angle, 0))
