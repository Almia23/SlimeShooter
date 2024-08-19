extends Area2D

func _physics_process(delta):
	var enemies_inrange = get_overlapping_bodies()
	if enemies_inrange.size() > 0:
		var target = enemies_inrange[0]
		look_at(target.global_position)

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position= %"shoot point".global_position
	new_bullet.global_rotation= %"shoot point".global_rotation
	%"shoot point".add_child(new_bullet)


func _on_timer_timeout():
	shoot()
