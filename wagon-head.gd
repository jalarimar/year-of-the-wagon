extends Area2D

enum Dir {
	NORTH,
	EAST,
	SOUTH,
	WEST
}
var dir_xy = {
	Dir.NORTH: Vector2(0, -1), 
	Dir.EAST: Vector2(1, 0), 
	Dir.SOUTH: Vector2(0, 1), 
	Dir.WEST: Vector2(-1, 0)
}
const hor_dirs = [Dir.EAST, Dir.WEST]
const ver_dirs = [Dir.NORTH, Dir.SOUTH]
var cur_dir = Dir.NORTH
var move_dir = Dir.NORTH

func _input(event): 
	if move_dir in hor_dirs: 
		#moving horizontally
		if event.is_action_pressed("player_up"): 
			cur_dir = Dir.NORTH
		if event.is_action_pressed("player_down"): 
			cur_dir = Dir.SOUTH
	if move_dir in ver_dirs: 
		# moving vertically
		if event.is_action_pressed("player_left"): 
			cur_dir = Dir.WEST
		if event.is_action_pressed("player_right"): 
			cur_dir = Dir.EAST

func move_wagon():
	move_dir = cur_dir
	set_pos(get_pos() + dir_xy[move_dir] * 32)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	set_process_input(true)
	pass
