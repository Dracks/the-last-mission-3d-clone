extends CharacterBody3D


@export var speed: float = 20
var is_top:=false
var is_runing:=false


func _physics_process(delta):
	if is_runing and not is_top:
		set_velocity(Vector3(0,speed*delta, 0))
		move_and_slide()

func _on_Area_body_entered(body):
	is_runing = true
