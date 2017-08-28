extends Node

# class member variables go here, for example:
const game_scene = preload("res://game.tscn")

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
	var current_scene = get_node("game")
	explored_scenes[Vector2(x, y)] = current_scene
	remove_child(current_scene)
	
	if dir == "north":
		y += 1
	elif dir == "east":
		x += 1
	elif dir == "south":
		y -= 1
	elif dir == "west":
		x -= 1
	
	var next_scene = game_scene.instance()
	next_scene.set_name("game")
	add_child(next_scene)
	get_node("game/wagon").connect("lose_signal", self, "_lose")
	get_node("game/wagon").connect("next_screen_signal", self, "_next_screen")