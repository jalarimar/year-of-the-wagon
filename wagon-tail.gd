extends KinematicBody2D

export(int, "wheat", "cotton") var type

func _ready():
	set_type(0)

func set_type(new_type):
	var sprs = get_node("crop-sprites")
	for spr in sprs.get_children():
		spr.set_hidden(true)
	if new_type == 0:
		sprs.get_node("wheat").set_hidden(false)
	if new_type == 1:
		sprs.get_node("cotton").set_hidden(false)
