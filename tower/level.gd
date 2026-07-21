extends Node

@export var bad_guy_scene: PackedScene

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_spawn_timer_timeout() -> void:
	var spawn = [$Spawn1, $Spawn2, $Spawn3].pick_random()
	var bad_guy = bad_guy_scene.instantiate()
	bad_guy.position = spawn.position
	bad_guy.z_index = -1
	add_child(bad_guy)
	pass

