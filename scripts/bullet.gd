extends Area2D

var travel_dist = 0
const SPEED = 1500
const RANGE = 1800

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travel_dist += SPEED * delta
	if travel_dist >= RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
