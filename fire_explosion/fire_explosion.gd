extends Node2D

@onready var _explosion_sprite = %ExplosionSprite

func _ready():

	_explosion_sprite.play("burn")
	await _explosion_sprite.animation_finished
	_explosion_sprite.stop()
	queue_free()
	
	
