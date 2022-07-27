extends Control

func _ready():
	set_points(0)
	set_lifes(10)

func set_points(points: int):
	$Panel/Score.text = "Score: "+str(points)

func set_lifes(lifes: int):
	$Panel/Lifes.text = "Lifes: "+str(lifes)
