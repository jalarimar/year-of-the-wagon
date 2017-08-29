tool
extends Area2D

enum Type {
	WHEAT = 0,
	COTTON = 1,
}

var gen = {
	Type.WHEAT: {
		"chance": 500,
		"name": "wheat",
	},
	Type.COTTON: {
		"chance": 1,
		"name": "cotton",
	},
}

var crop_type

func get_option():
	var sum = 0
	for v in gen.values():
		sum += v.chance
	var r = randi() % sum
	
	var running_sum = 0
	for k in gen.keys():
		if running_sum <= r and r < running_sum + gen[k].chance:
			return k
		
		running_sum += gen[k].chance

func _ready():
	var sprites = get_node("sprites")
	for sprite in sprites.get_children():
		sprite.set_hidden(true)
	crop_type = get_option()
	sprites.get_node(gen[crop_type].name).set_hidden(false)

