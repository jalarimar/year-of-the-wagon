extends Node

var explored_scenes = {}
var x = 0
var y = 0

func _ready():
	get_node("end-screen").set_hidden(true)
	get_node("game/wagon").connect("lose_signal", self, "_lose")
	get_node("game/wagon").connect("next_screen_signal", self, "_next_screen")

func _lose():
	get_node("game").set_hidden(true)
	get_node("end-screen").set_hidden(false)
	
func _next_screen(dir):
	print("change")