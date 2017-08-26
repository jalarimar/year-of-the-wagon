extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const wheat_scene = preload("res://wheat.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	for i in range(25):
		for j in range(25):
			if rand_range(0, 1) < 0.1:
				var wheat = wheat_scene.instance()
				wheat.set_pos(Vector2(i*32, j*32))
				add_child(wheat)
				wheat.connect("body_enter", get_parent().get_node("wagon-head"), "_on_wheat_body_enter", [wheat])
