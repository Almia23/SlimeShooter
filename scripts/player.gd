extends CharacterBody2D

signal health_depleted
@onready var happy_boo = %HappyBoo
var health = 100.0
const DAMAGE_RATE = 5.0


func _physics_process(delta):
	var direction  = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0:
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()
		
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * delta * overlapping_mobs.size()
		%ProgressBar.value = health
		if health <= 0.0:
			health = 0
			health_depleted.emit()
	

	
