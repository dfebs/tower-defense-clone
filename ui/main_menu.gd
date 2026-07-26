extends Node
signal start_game

func _ready() -> void:
	$Button.pressed.connect(_on_button_pressed)
	pass


func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	print("button pressed")
	start_game.emit()

func disable() -> void:
	$Button.hide()
	$Label.hide()

func enable() -> void:
	$Button.show()
	$Label.show()

func next_level_mode(level: int) -> void:
	$Label.text = "Level " + str(level) + " complete!"
	$Button.text = "Next Level"

func main_menu_mode() -> void:
	$Label.text = "Cool Tower Defense Video Game"
	$Button.text = "Start Game"
