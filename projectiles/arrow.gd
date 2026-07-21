extends Area2D

const SPEED = 300
var direction = Vector2(0, 0)

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
	var angle = direction.angle()
	rotation = angle
