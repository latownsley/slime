extends Control

@onready var game = $".."

func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	pass # Replace with function body.


func _on_resume_pressed():
	game.pause_menu()


