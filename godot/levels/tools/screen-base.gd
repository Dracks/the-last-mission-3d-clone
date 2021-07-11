extends Spatial

class_name ScreenBase

const WINDOW_SIZE=15
export(int) var width : float = 26 setget set_screen_width

func set_screen_width(new_width: float):
	width = new_width
	if $Focus:
		$Focus.screen_width = new_width

# Called when the node enters the scene tree for the first time.
func _ready():
	$Focus.screen_width = width 
