extends CharacterBody2D


var health = 2
var knocked_back = Vector2.ZERO
var knockback_modifier = 1000.0

@onready var player = get_node("/root/Game/Level/Player")


func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position).normalized()
	velocity = direction * 300.0 + knocked_back
	move_and_slide()
	knocked_back = lerp(knocked_back, Vector2.ZERO, 0.1)
	

func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position

func knockback(damage_source_position):
	var knockback_direction = damage_source_position.direction_to(self.global_position)
	knocked_back = knockback_direction * knockback_modifier

