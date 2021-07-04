extends Spatial


signal go_to_next
signal go_to_previous

func _ready():
	$Next.connect("next", self, "next")
	$Prev.connect("next", self, "prev")
	$Prev.other = $Next
	$Next.other = $Prev
	
func next():
	emit_signal("go_to_next")
	
func prev():
	emit_signal("go_to_previous")
