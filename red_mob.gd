extends CharacterBody2D


var health = 3
var bodies_in_range = []
var knocked_back = Vector2.ZERO
var knockback_modifier = 1000.0

@onready var player = get_node("/root/Game/Level/Player")


func _ready():
	%SlimeRed.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position).normalized()
	velocity = direction * 300.0 + knocked_back
	move_and_slide()
	knocked_back = lerp(knocked_back, Vector2.ZERO, 0.1)

func take_damage():
	health -= 1
	%SlimeRed.play_hurt()
	
	if health == 0:
		slime_death()



func slime_death():
	queue_free()
	
	const FIRE_EXPLOSION = preload("res://fire_explosion/fire_explosion.tscn")
	var fire = FIRE_EXPLOSION.instantiate()
	get_parent().add_child(fire)
	fire.global_position = global_position
	
	_damage_slimes_nearby()

func _damage_slimes_nearby():
	if not bodies_in_range.is_empty():
		for body in bodies_in_range:
			if body.has_method("take_damage"):
				body.take_damage()

func _on_death_damage_range_entered(body):
	bodies_in_range.append(body)


func _on_death_damage_range_body_exited(body):
	bodies_in_range.erase(body)
