extends Spatial

export var initial_checkpoint := false

var tank_body_in := false

onready var gc : GameController = get_node('/root/GameController')

func _ready():
	if self.initial_checkpoint:
		gc.set_restart_coords(to_global(Vector3.ZERO))
		gc.call_deferred('instantiate_head')

func init():
	if tank_body_in:
		gc.set_restart_coords(to_global(Vector3.ZERO))

func _on_Focus_on_tank_body_in():
	tank_body_in = true

func _on_Focus_on_tank_body_out():
	tank_body_in = false
