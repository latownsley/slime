extends Node2D


func spawn_mob():
	# spawns green mobs
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_red_mob():
	var new_red_mob = preload("res://red_mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_red_mob.global_position = %PathFollow2D.global_position
	add_child(new_red_mob)

func spawn_yellow_mob():
	%CirclePathFollow.progress_ratio = 0.0
	while %CirclePathFollow.progress_ratio != 1.0:
		var new_yellow_mob = preload("res://yellow_mob.tscn").instantiate()
		new_yellow_mob.global_position = %CirclePathFollow.global_position
		add_child(new_yellow_mob)
		%CirclePathFollow.progress_ratio += 0.1
		
		# var direction = global_position.direction_to(%Player.global_position)
		# direction = -direction * 100
		# new_yellow_mob.global_position = %Player.global_position +  Vector2.RIGHT.rotated(randi_range(0,360)) * 100 + direction
		# add_child(new_yellow_mob)

func spawn_warning():
	pass
	#%SpawnIncoming.visible = true
	

func _on_timer_timeout():
	spawn_mob()

func _on_yellow_timer_timeout():
	pass
	#for x in range(0, 8):
		#spawn_yellow_mob()

func _on_red_timer_timeout():
	spawn_red_mob()


