extends Node

var explored_scenes = {}
var x = 0
var y = 0

var current_tail = 0
var longest_tail = 0
var score = 0

var game

func _ready():
	get_node("end-screen").set_hidden(true)
	get_node("game/wagon").connect("lose_signal", self, "_lose")
	get_node("game/wagon").connect("next_screen_signal", self, "_next_screen")

func _lose():
	print("asdf")
	get_node("end-screen").set_hidden(false)
	game = get_node("game")
	get_tree().set_pause(true)
	
	#get_node("game").set_hidden(true)
	
	get_node("end-screen/stats/score").set_text("Score: " + str(score))
	get_node("end-screen/stats/wagon-length").set_text("Current Length: " + str(current_tail))
	get_node("end-screen/stats/longest-wagon").set_text("Longest Wagon: " + str(longest_tail))
	
func _next_screen(dir):
	print("change")
