class_name Mob
extends CharacterBody2D

@export var speed:int = 300
@export var health:float = 3.0
@export var explosion: PackedScene = preload("res://smoke_explosion/smoke_explosion.tscn")

@onready var player: CharacterBody2D = get_node("/root/Game/Player")
@onready var health_bar: ProgressBar = $HealthBar
@onready var slime: Node2D = %Slime

func _ready():
	health_bar.max_value = health
	health_bar.value = health
	slime.play_walk()
	
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()


func take_damage(points):
	slime.play_hurt()
	health -= points
	health_bar.value = health
	if health <= 0:
		var destroyed = explosion.instantiate()
		get_parent().add_child(destroyed)
		destroyed.global_position = global_position
		queue_free()
