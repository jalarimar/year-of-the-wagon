tool
extends Node2D

onready var wagode = get_node("../../../wagon")

const crop_scene = preload("res://crop.tscn")

func new_crop(i, j):
	var crop = crop_scene.instance()
	crop.set_pos(Vector2(i*32, j*32))
	add_child(crop)
	crop.connect("area_enter", wagode, "_on_crop_collide", [crop])

func generate_crops():
	for i in range(1, 25):
		for j in range(1, 20):
			var r = randi() % 10
			if r == 0:
				new_crop(i, j)

func _ready():
	generate_crops()