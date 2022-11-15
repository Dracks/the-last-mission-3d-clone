extends Node3D

class_name Gun

@onready var turret: CharacterBody3D = get_parent()
@onready var world: Node3D = find_parent("World3D")

var is_shoting: bool = false
var next_shot_delay : float = 0
@export var max_delay: float = 0.2
var enabled: bool = true

@export var bullet: PackedScene
@onready var bullet_instance = bullet.instantiate()
# var bullet = preload("res://tank/Bullet.tscn")

func _input(event: InputEvent):
	if event.is_action("ui_shot"):
		is_shoting = event.is_pressed()

func _ready():
	print($LaserSound.stream)
	print($LaserSound.stream.loop)
	$LaserSound.stream.loop = false

func _process(delta: float):
	if next_shot_delay <= 0:
		if enabled and is_shoting:
			get_parent().emit_signal("shot", bullet_instance.duplicate(), to_global(Vector3.ZERO), get_parent().looking_right)
			$LaserSound.play()
			next_shot_delay = max_delay
	else:
		next_shot_delay = next_shot_delay - delta
