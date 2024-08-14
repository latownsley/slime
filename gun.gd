extends Area2D


func _physics_process(delta):
	"""
	Turn the Gun to find enemies and aim at them
	"""
	var enemies_in_range = get_overlapping_bodies()  # #returns a array of bodies in range
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		look_at(target_enemy.global_position)

func shoot():
	# preload() (static, loads before game) vs load() (doesn't load until this is called)
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	
	


func _on_timer_timeout():
	shoot()
	# shoots on a timer currently 3/sec 
