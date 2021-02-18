extends Node

const METEOR = preload("res://src/actors/Meteor.tscn")
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	spawn()

func spawn():
	#1060 x       -32 -568 y
	print("SPAWNING")
	var meteor = METEOR.instance()
	var pos = Vector2()
	pos.x = 1060
	rng.randomize()
	pos.y = floor(rng.randf_range(-32, -568))
	meteor.set_position(pos)
	meteor.z_index = 1
	print(meteor.get_position())
	var meteorContainer = get_node("Container") 
	meteorContainer.add_child(meteor)
