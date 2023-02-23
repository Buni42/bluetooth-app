extends Node

onready var options = load("res://objects/options.tscn")

func _ready() -> void:
	OS.set_window_title("bluetooth app")
	OS.center_window()
	set_physics_process(false)
	Game.PORT.open(Game.port, Game.baudrate, 1000, Game.com.bytesz.SER_BYTESZ_8, Game.com.parity.SER_PAR_NONE, Game.com.stopbyte.SER_STOPB_ONE)
	Game.PORT.flush()
	set_physics_process(true)

func _on_options_pressed() -> void:
	print("options")
	if Game.options_pressed == true:
		get_tree().paused = false
		get_parent().get_node("options").queue_free()
		Game.options_pressed = false
	else:
		Game.options_pressed = true
		get_tree().paused = true
		var options_scene = options.instance()
		get_parent().add_child(options_scene)
