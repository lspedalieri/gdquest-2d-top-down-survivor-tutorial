extends Area2D

@export var speed: float = 1000.0
@export var range: float = 1200.0
@export var damage: float = 1.0
var travelled_distance: float = 0.0


func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	if travelled_distance > range:
		queue_free()


func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()
