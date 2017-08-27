extends Node2D

onready var wagode = get_parent().get_node("wagon")

enum Crop {
	WHEAT = 0,
	COTTON = 1
}

const crop_scene = preload("res://crop.tscn")
const hedge_scene = preload("res://hedge.tscn")

func new_crop(crop_type, i, j):
	var crop = crop_scene.instance()
	crop.set_pos(Vector2(i*32, j*32))
	crop.crop_type = crop_type
	add_child(crop)
	crop.connect("area_enter", wagode, "_on_crop_collide", [crop])

func new_obstacle(obstacle_scene, i, j):
	var obstacle = obstacle_scene.instance()
	obstacle.set_pos(Vector2(i*32, j*32))
	add_child(obstacle)
	obstacle.connect("area_enter", wagode, "_on_wagon_collide")

func generate_hedges():
	for i in range(0, 26):
		for j in [0, 20]:
			new_obstacle(hedge_scene, i, j)
	for i in [0, 25]:
		for j in range(0, 21):
			new_obstacle(hedge_scene, i, j)

func generate_crops():
	for i in range(1, 25):
		for j in range(1, 20):
			var r = randi() % 10
			if r == 0:
				new_crop(Crop.WHEAT, i, j)
			elif r == 1:
				new_crop(Crop.COTTON, i, j)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	generate_hedges()
	generate_crops()