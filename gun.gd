extends Area2D

@export var BULLET:PackedScene
@onready var shooting_timer: Timer = $ShootingTimer


#func _ready():
	#shooting_timer.timeout.connect(shoot)

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	#print(enemies_in_range)
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front() as CharacterBody2D
		look_at(target_enemy.global_position)

func shoot():
	var new_bullet = BULLET.instantiate() as Area2D
	#new_bullet.rotate(rotation)
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)


func _on_shooting_timer_timeout():
	shoot()
