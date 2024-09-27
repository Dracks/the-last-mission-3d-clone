extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func generate_image(viewport: Viewport, image_name: String):
	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	var image = viewport.get_texture().get_data()
	image.flip_y()

	var err = image.save_png("assets/psvita/%s.png" % [image_name])
	if err:
		print("Error generating image %s: %s" % [image_name, err])
	else:
		print("Saved correctly image %s" %[image_name])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_generate_images_pressed():
	generate_image($"App Splash/Viewport", "app_splash")
	generate_image($"Icon/Viewport", "icon")
	generate_image($"Livearea BG/Viewport", 'livearea_bg')
	generate_image($"Livearea Button/Viewport", 'livearea_button')
