extends Control

onready var options = load("res://objects/options.tscn")


func _physics_process(delta):
	if Game.PORT != null && Game.PORT.get_available() > 0:
		for i in range(Game.PORT.get_available()):
			Game.port_data = str(Game.PORT.read())
			Game.port_data = Game.port_data
#			print(port_data)
	if Game.PORT.get_available() < 0:
		push_warning("arduino not connected to correct COM")


func _on_boven_pressed() -> void:
	Game.PORT.write("2")
	print("2")


func _on_beneden_pressed() -> void:
	Game.PORT.write("3")
	print("3")


func _on_origin_pressed() -> void:
	Game.PORT.write("4")
	print("4")


func _on_power_pressed() -> void:
	if Game.power_pressed == false:
		Game.PORT.write("1")
		print("1")
		get_node("TabContainer/1-axis/power/Label").text = "on"
		get_node("TabContainer/1-axis/power").self_modulate = Color("d7085b3b")
		Game.power_pressed = true
	else:
		Game.PORT.write("0")
		print("0")
		get_node("TabContainer/1-axis/power/Label").text = "off"
		get_node("TabContainer/1-axis/power").self_modulate = Color("d75b1008")
		Game.power_pressed = false
