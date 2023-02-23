extends Node

#arduino vars
const SERCOMM = preload("res://addons/GDSerCommDock/bin/GDSerComm.gdns")
onready var PORT = SERCOMM.new()
onready var com = get_tree().current_scene.get_child(0)
var port_data
var port = "COM9"
var baudrate = 9600
var options_pressed = false
var power_pressed = false
