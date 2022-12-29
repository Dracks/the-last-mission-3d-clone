extends KinematicBody


export(float) var speed = 20
var is_top:=false
var is_runing:=false


func _physics_process(delta):
	if is_runing and not is_top:
		move_and_slide(Vector3(0,speed*delta, 0))


func _on_trigger_area_entered(area):
	print("Hey I'm inside")
	is_runing = true
