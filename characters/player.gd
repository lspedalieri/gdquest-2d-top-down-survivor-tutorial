class_name Player
extends CharacterBody2D

signal health_depleted

@export var damage_rate: float = 1.0
@onready var happy_boo = $HappyBoo
@onready var hurtbox: Area2D = %Hurtbox
@onready var health_bar: ProgressBar = $HealthBar
var health: float = 100.0
var max_health: float


func _ready():
	health_bar.max_value = health
	health_bar.value = health


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	if velocity.length() > 0.0:
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()

	var overlapping_mobs = hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= damage_rate * overlapping_mobs.size() * delta
		health_bar.value = health
		if health < 0.0:
			health_depleted.emit()
			#queue_free()
