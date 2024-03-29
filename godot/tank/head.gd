extends KinematicBody

signal shot(bullet, translation, looking_right)
signal life_lost

class_name Turret

var up: bool = false
var down: bool = false
var left: bool = false
var right: bool = false

var looking_right: bool = false
var looking_left: bool = false
var current_angle: float = 0
var is_coupled: bool = false

# velocity
export var v_rotate: float = PI*1.5
export var v_horizontal: float = 14
export var v_vertical: float = 14

var up_direction = Vector3(0, v_vertical, 0)
var forward = Vector3(v_horizontal, 0, 0)

var tank_body : TankBody

onready var gc = get_node("/root/GameController")

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
	
func _process(delta:float):
	if !is_coupled:
		gc.dec_energy(delta)

func _physics_process(delta: float):
	if up or down:
		if up and not down:
			move_and_collide(up_direction*delta)
		elif down:
			move_and_collide(-2*delta*up_direction)
		else:
			move_and_collide(-delta*up_direction)
	else:
		var collision = move_and_collide(-delta*up_direction, true, true, true)
		if not collision or not collision.travel or abs(collision.travel.z)>0.01:
			move_and_collide(-delta*up_direction)
		# move_and_collide(-delta*up_direction)
	
	if left or right:
		if left and not right:
			if not looking_left:
				rotate_logic(v_rotate*delta)
			else:
				move_with_body(-forward*delta)
		elif right:
			if not looking_right:
				rotate_logic(-v_rotate*delta)
			else:
				move_with_body(forward*delta)


func move_with_body(movement: Vector3):
	if is_coupled:
		var collision = tank_body.move_and_collide(movement, true, true, true)
		if collision:
			movement = collision.get_travel()
		"""var collision2 = move_and_collide(movement, true, true, true)
		if collision2:
			movement = collision2.get_travel()"""
		tank_body.move_and_collide(movement)
	else: 
		movement.z = -translation.z
	move_and_collide(movement)
	

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


func _on_Coupling_body_entered(body):
	print("Coupling on!", body, to_global(Vector3.ZERO))
	is_coupled = true
	tank_body = body.get_parent()
	var tank_position = tank_body.to_global(Vector3.ZERO)
	var difference = tank_position - to_global(Vector3.ZERO)
	move_and_collide(Vector3(difference.x, 0, difference.z))
	

func _on_Coupling_body_exited(body):
	is_coupled = false
	
func damage():
	emit_signal("life_lost")
	queue_free()
