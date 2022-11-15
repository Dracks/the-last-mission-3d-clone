@tool 

extends Node3D

class_name ScreenBase

const WINDOW_HEIGHT=15
@export var width: float = 26 :
	get:
		return width # TODOConverter40 Non existent get function 
	set(mod_value):
		mod_value  # TODOConverter40 Copy here content of set_screen_width

func set_screen_width(new_width: float):
	width = new_width
	if $Focus:
		$Focus.screen_width = new_width

# Called when the node enters the scene tree for the first time.
func _ready():
	$Focus.screen_width = width 


func _on_Focus_on_focus():
	for child_task in $Tasks.get_children():
		child_task.init()
