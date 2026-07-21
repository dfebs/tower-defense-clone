extends Node2D
@export var projectile_class: PackedScene

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("fire"):
		var direction = (event.position - global_position).normalized()
		var projectile = projectile_class.instantiate()

		projectile.direction = direction

		add_child(projectile)
