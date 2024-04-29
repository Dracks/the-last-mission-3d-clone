extends Spatial

onready var animation_player : AnimationPlayer = $AnimationPlayer


func _on_Area_body_entered(body):
	animation_player.play("going-up")
