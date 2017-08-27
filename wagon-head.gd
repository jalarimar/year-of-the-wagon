extends KinematicBody2D

enum DIR {
	north,
	east,
	south,
	west
}
var dir_xy = {
	DIR.north: Vector2(0, -1), 
	DIR.east: Vector2(1, 0), 
	DIR.south: Vector2(0, 1), 
	DIR.west: Vector2(-1, 0)
}
const hor_dirs = [DIR.east, DIR.west]
const ver_dirs = [DIR.north, DIR.south]
var cur_dir = DIR.north
var move_dir = DIR.north

func _input(event): 
	if move_dir in hor_dirs: 
		#moving horizontally
		if event.is_action_pressed("player_up"): 
			cur_dir = DIR.north
		if event.is_action_pressed("player_down"): 
			cur_dir = DIR.south
	if move_dir in ver_dirs: 
		# moving vertically
		if event.is_action_pressed("player_left"): 
			cur_dir = DIR.west
		if event.is_action_pressed("player_right"): 
			cur_dir = DIR.east

func _timer():
	move_dir = cur_dir
	move(dir_xy[move_dir] * 32)
	

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	set_process_input(true)
	pass
