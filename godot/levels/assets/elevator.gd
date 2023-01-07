extends KinematicBody


export(float) var speed = 20
var is_top:=false
var is_runing:=false


func _physics_process(delta):
	if is_runing and not is_top:
		move_and_slide(Vector3(0,speed*delta, 0))

func _on_Area_body_entered(body):
	is_runing = true
