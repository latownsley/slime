extends Area2D

var travelled_distance = 0
var direction

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	direction = Vector2.RIGHT.rotated(rotation) # current direction the bullet is facing
	position += direction * SPEED * delta  
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free() # kill bullet



func _on_body_entered(body):
	queue_free() # waits 1 frame before destroying the bullet
	if body.has_method("take_damage"):
		body.take_damage()
	if body.has_method("knockback"):
		body.knockback(self.global_position)
