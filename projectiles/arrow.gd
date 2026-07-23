extends Area2D

const SPEED = 350
var direction = Vector2(0, 0)

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
	var angle = direction.angle()
	rotation = angle


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		body.die()
	queue_free()
