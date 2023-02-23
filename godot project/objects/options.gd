extends Control


var comms = ["COM1", "COM2", "COM3", "COM4", "COM5", "COM6", "COM7", "COM8", "COM9"]
var rates = [300, 1200, 2400, 4800, 9600, 19200, 38400, 57600, 74880, 115200, 230400, 250000, 500000, 1000000, 2000000]
onready var port_button = $VBoxContainer/port
onready var baudrate_button = $VBoxContainer/baudrate
onready var options = load("res://objects/options.tscn")


func _on_port_pressed() -> void:
	port_button.clear()
	for i in comms:
		port_button.add_item(i)

func _on_baudrate_pressed() -> void:
	baudrate_button.clear()
	for i in rates:
		baudrate_button.add_item(str(i))


func _on_port_item_selected(index: int) -> void:
	Game.port = str(port_button.get_item_text(port_button.get_selected_id()))
	print(Game.port)
	set_physics_process(false)
	Game.PORT.open(Game.port, Game.baudrate, 1000, Game.com.bytesz.SER_BYTESZ_8, Game.com.parity.SER_PAR_NONE, Game.com.stopbyte.SER_STOPB_ONE)
	Game.PORT.flush()
	set_physics_process(true)


func _on_baudrate_item_selected(index: int) -> void:
	Game.baudrate = int(baudrate_button.get_item_text(baudrate_button.get_selected_id()))
	print(Game.baudrate)
	set_physics_process(false)
	Game.PORT.open(Game.port, Game.baudrate, 1000, Game.com.bytesz.SER_BYTESZ_8, Game.com.parity.SER_PAR_NONE, Game.com.stopbyte.SER_STOPB_ONE)
	Game.PORT.flush()
	set_physics_process(true)




