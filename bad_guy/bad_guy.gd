extends CharacterBody2D
const speed = 200

signal exited
signal died(pos: Vector2)

func _ready() -> void:
	$AnimatedSprite2D.play()
	pass

func _process(delta: float) -> void:
	velocity = speed * Vector2.LEFT
	move_and_collide(delta * velocity)
	pass

func die():
	died.emit(global_position)
	queue_free()

func _on_screen_exit() -> void:
	exited.emit()
	pass

