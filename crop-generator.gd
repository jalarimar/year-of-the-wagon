extends Node

onready var wagode = get_parent().get_node("wagon")

const wheat_scene = preload("res://wheat.tscn")
const cotton_scene = preload("res://cotton.tscn")
const hedge_scene = preload("res://hedge.tscn")
func new_crop(crop_scene, i, j):
	var crop = crop_scene.instance()
	crop.set_pos(Vector2(i*32, j*32))
	add_child(crop)
	crop.connect("body_enter", wagode, "_on_crop_collide", [crop])

func generate_hedges():
	for i in range(0, 26):
		for j in [0, 20]:
			new_crop(hedge_scene, i, j)
	for i in [0, 25]:
		for j in range(0, 21):
			new_crop(hedge_scene, i, j)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	generate_hedges()
	for i in range(1, 25):
		for j in range(1, 20):
			var r = randi() % 10
			if r == 0:
				new_crop(wheat_scene, i, j)
			elif r == 1:
				new_crop(cotton_scene, i, j)