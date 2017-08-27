extends Area2D

func _ready():
	set_type(0)

func set_type(new_type):
	var sprites = get_node("crop-sprites")
	for sprite in sprites.get_children():
		sprite.set_hidden(true)
	if new_type == 0:
		sprites.get_node("wheat").set_hidden(false)
	if new_type == 1:
		sprites.get_node("cotton").set_hidden(false)
