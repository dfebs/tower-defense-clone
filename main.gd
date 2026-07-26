extends Node

@export var level_class: PackedScene
@export var notify_class: PackedScene

var spawn_delay = 2.0
var level_num = 1

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
	$Level.win_game.connect(_win_game)

	spawn_delay = spawn_delay - (level_num - 1) * 0.4
	level.begin_level(spawn_delay)
	print ("starting level with spawn delay " + str(spawn_delay))

func _end_game(message: String):
	$Level.queue_free()
	await _notify(message)
	$MainMenu.enable()

func _next_level(message: String):
	$Level.queue_free()
	await _notify(message)
	$MainMenu.enable()
	pass

func _lose_game():
	_end_game("You lose!")
	_reset_game()

func _reset_game():
	level_num = 1
	spawn_delay = 2.0
	$MainMenu.main_menu_mode()

func _win_game():
	if level_num == 3:
		_end_game("You won the whole video game!")
		_reset_game()
	else:
		_end_game("You won!")
		$MainMenu.next_level_mode(level_num)
		level_num += 1

func _notify(message):
	var notify = notify_class.instantiate()
	notify.text = message
	add_child(notify)

	await get_tree().create_timer(2.5).timeout
	notify.queue_free()

