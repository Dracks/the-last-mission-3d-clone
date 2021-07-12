extends Control

func _ready():
	set_points(0)

func set_points(points: int):
	$Panel/Score.text = "Score: "+str(points)
