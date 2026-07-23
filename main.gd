extends Node

@export var level_class: PackedScene
@export var notify_class: PackedScene

# Could use an array of PackedScenes for multiple levels possibly
# @export var levels: Array[PackedScene] = []

func _ready() -> void:
	$MainMenu.start_game.connect(_on_main_menu_start_game)
	pass


func _process(_delta: float) -> void:
	pass


func _on_main_menu_start_game() -> void:
	var level = level_class.instantiate()
	$MainMenu.disable()
	add_child(level)
	$Level.lose_game.connect(_lose_game)

func _lose_game():
	$Level.queue_free()

	var notify = notify_class.instantiate()
	add_child(notify)

	await get_tree().create_timer(2.5).timeout
	notify.queue_free()

	$MainMenu.enable()

