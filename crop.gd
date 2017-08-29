tool
extends Area2D

var crop_type = 0 setget set_crop_type

func set_crop_type(new_type):
	var sprites = get_node("sprites")
	for sprite in sprites.get_children():
		sprite.set_hidden(true)
	if new_type == 0:
		sprites.get_node("wheat").set_hidden(false)
	if new_type == 1:
		sprites.get_node("cotton").set_hidden(false)
	crop_type = new_type