extends Node2D


var paused = false		

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu()

func pause_menu():
	if paused:
		%PauseMenu.hide()
		%Level.get_tree().paused = false
	else:
		%PauseMenu.show()
		%Level.get_tree().paused = true
	
	paused = !paused


