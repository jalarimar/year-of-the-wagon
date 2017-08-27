extends Node

var wagon_tail = []

func _process(delta):
	pass

func _ready():
	# Called every time the node is added to the scene.
	set_process(true)
	for wagon in get_node("wagon-tails").get_children():
		wagon_tail.append(wagon)

func _on_wagontimer_timeout():
	for i in range(wagon_tail.size()-1, 0, -1):
		var pos = wagon_tail[i-1].get_pos()
		wagon_tail[i].set_pos(pos)
	var wagon_head = get_node("wagon-head")
	wagon_tail[0].set_pos(wagon_head.get_pos())
		

func _on_crop_collide(body, crop):
	crop.queue_free()
