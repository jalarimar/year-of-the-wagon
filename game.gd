extends Node2D

var areas = {}

var area_scene = preload("res://area.tscn")

func round_screen(pos):
	return get_screen_pos(get_screen(pos))

func get_screen(pos):
	var size = Vector2(800, 640)
	return Vector2(floor(pos.x/size.x), floor(pos.y/size.y))
	
func get_screen_pos(screen):
	var size = Vector2(800, 640)
	return screen*size

func spawn_areas():
	var curr_screen = get_screen(get_node("wagon/wagon-head").get_pos())
	
	var mods = [
		               Vector2(0,-1), Vector2(1,-1),
		Vector2(-1,0), Vector2(0,0), Vector2(1,0), Vector2(2,0),
		Vector2(-1,1), Vector2(0,1), Vector2(1,1),
		               Vector2(0,2)
	]
	for mod in mods:
		var screen = curr_screen + mod
		if not screen in areas:
			var area = area_scene.instance()
			area.set_pos(get_screen_pos(screen))
			areas[screen] = area
			get_node("areas").add_child(area)

func _ready():
	
	spawn_areas()
	set_process(true)

func _process(delta):
	var wagon_pos = get_node("wagon/wagon-head").get_pos()
	var curr_pos = get_node("Camera2D").get_pos()
	if wagon_pos.x < curr_pos.x or wagon_pos.x > curr_pos.x + 800 \
	or wagon_pos.y < curr_pos.y or wagon_pos.y > curr_pos.y + 640:
		get_node("Camera2D").set_pos(round_screen(wagon_pos))
		spawn_areas()
	
