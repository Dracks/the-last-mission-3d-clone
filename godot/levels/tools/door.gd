extends Area

class_name DoorComponent

signal next

var inside : bool = false
var other: DoorComponent;

func _ready():
	connect("body_entered", self, "on_body_entered")
	connect("body_exited", self, "on_body_leaved")

func on_body_entered(body):
	print("in:", body)
	inside = true


func on_body_leaved(body):
	print("out:", body)
	inside = false
	if other and not other.inside:
		emit_signal("next")
