extends Node

@export var bad_guy_scene: PackedScene
const ENEMY_GROUP = "enemies"

signal lose_game
signal win_game

func _ready() -> void:
	$SpawnTimer.timeout.connect(_on_spawn_timer_timeout)
	$LevelTimer.timeout.connect(_on_level_timer_timeout)
	pass

func _process(_delta: float) -> void:
	if $SpawnTimer.is_stopped():
		var bad_guys = get_tree().get_nodes_in_group(ENEMY_GROUP).size()
		if bad_guys == 0:
			win_game.emit()

func _on_spawn_timer_timeout() -> void:
	var spawn = [$Spawn1, $Spawn2, $Spawn3].pick_random()
	var bad_guy = bad_guy_scene.instantiate()

	bad_guy.position = spawn.position
	bad_guy.z_index = -1
	bad_guy.add_to_group(ENEMY_GROUP)

	add_child(bad_guy)
	bad_guy.exited.connect(_lose_game)

func _on_level_timer_timeout() -> void:
	$SpawnTimer.stop()
	pass

func _lose_game() -> void:
	lose_game.emit()

