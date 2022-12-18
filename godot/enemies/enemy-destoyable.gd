extends EnemyBase

func damage():
	gc.inc_points(points)
	$ExplosionSound.play()
	queue_free()
