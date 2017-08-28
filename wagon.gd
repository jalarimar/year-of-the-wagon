extends Node2D

signal lose_signal
signal next_screen_signal

var picked_up_crop = null
var wagon_tail = []
const wagon_cart_scene = preload("res://wagon-cart.tscn")

func _process(delta):
	pass

func _ready():
	# Called every time the node is added to the scene.
	set_process(true)
	for wagon in get_node("wagon-tail").get_children():
		wagon_tail.append(wagon)

func add_cart():
	var wagon_cart = wagon_cart_scene.instance()
	wagon_cart.crop_type = picked_up_crop
	wagon_tail.append(wagon_cart)
	var yotw = get_tree().get_root().get_node("YOTW")
	yotw.score += 1
	yotw.current_tail = wagon_tail.size()
	if wagon_tail.size() > yotw.longest_tail:
		yotw.longest_tail = wagon_tail.size()
	add_child(wagon_cart)
	wagon_cart.connect("area_enter", self, "_on_wagon_collide")
	

func _on_wagontimer_timeout():
	var wagon_head = get_node("wagon-head")
	var prev_head_pos = wagon_head.get_pos()
	wagon_head.move_wagon()
	
	var positions = []
	positions.append(prev_head_pos)
	for wagon in wagon_tail:
		positions.append(wagon.get_pos())
	
	if picked_up_crop != null:
		add_cart()
		picked_up_crop = null
	
	for i in range(wagon_tail.size()):
		wagon_tail[i].set_pos(positions[i])

func _on_crop_collide(area, crop):
	picked_up_crop = crop.crop_type
	crop.queue_free()
	
func _on_wagon_collide(area):
	if area.get_name() == "wagon-head":
		emit_signal("lose_signal")
		#emit_signal("next_screen_signal", ["north"])
