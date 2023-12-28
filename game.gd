extends Node2D

@export var mob: PackedScene = preload("res://mob.tscn")
@onready var mob_spawn_area:PathFollow2D = %PathFollow2D
@onready var spawn_mob_timer:Timer = $SpawnMobTimer
@onready var game_over: CanvasLayer = %GameOver


func _ready():
	game_over.visible = false
	spawn_mob_timer.timeout.connect(spawn_mob)


func spawn_mob():
	var new_mob = mob.instantiate() as Node2D
	mob_spawn_area.progress_ratio = randf()
	new_mob.global_position = mob_spawn_area.global_position
	add_child(new_mob)


func _on_player_health_depleted():
	game_over.visible = true
	get_tree().paused = true
