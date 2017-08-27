extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("end-screen").set_hidden(true)

func _lose():
	get_node("game").set_hidden(true)
	get_node("end-screen").set_hidden(false)