tool
extends Node2D

const hedge_scene = preload("res://hedge.tscn")

onready var wagode = get_node("../../../wagon")

func new_obstacle(obstacle_scene, i, j):
	var obstacle = obstacle_scene.instance()
	obstacle.set_pos(Vector2(i*32, j*32))
	add_child(obstacle)
	obstacle.connect("area_enter", wagode, "_on_wagon_collide")

func generate_hedges():
	for i in range(0, 25):
		for j in [0]:
			new_obstacle(hedge_scene, i, j)
	for i in [0]:
		for j in range(0, 20):
			new_obstacle(hedge_scene, i, j)

func _ready():
	generate_hedges()
