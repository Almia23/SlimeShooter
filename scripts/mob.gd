extends CharacterBody2D

var direction
var health = 100

@onready var player = get_node("/root/Game/player")
@onready var slime = %Slime
const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")

func _ready():
	slime.play_walk()


	
func _physics_process(delta):
	direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0 
	move_and_slide()

func take_damage():
	slime.play_hurt()
	health -= 40
	if health <= 0:
		queue_free()
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
