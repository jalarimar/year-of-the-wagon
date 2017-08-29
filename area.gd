tool
extends Node2D

enum Type {
	NORMAL = 0,
	STATION = 1
}

var gen = {
	Type.NORMAL: {
		"chance": 500,
		"scene": preload("res://crop-generator.tscn")
	},
	Type.STATION: {
		"chance": 25,
		"scene": preload("res://crop-generator.tscn")
	},
}

func get_option():
	var sum = 0
	for v in gen.values():
		sum += v.chance
	var r = randi() % sum
	
	var running_sum = 0
	for k in gen.keys():
		if running_sum <= r < running_sum + gen[k].chance:
			return k
		
		running_sum += gen[k].chance

func _ready():
	var option = get_option()
	
	add_child(gen[option].scene.instance())