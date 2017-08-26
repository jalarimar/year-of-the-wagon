extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const wheat_scene = preload("res://wheat.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var wheat = wheat_scene.instance()
	wheat.set_pos(Vector2(32, 32))
	wheat.set_name("max")
	add_child(wheat)
	
	wheat.connect("body_enter", get_parent().get_node("wagon-head"), "_on_wheat_body_enter")
