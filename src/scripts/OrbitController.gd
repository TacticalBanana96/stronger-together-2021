#tool
extends Node2D

export var radius = Vector2.ONE * 100 
export var rotation_duration := 4.0 

var moons = [] 
var orbit_angle_offset = 0 
var prev_child_count = 0 
var moonSize

func _physics_process(delta):
	if prev_child_count != get_child_count():
		prev_child_count = get_child_count()
		_find_moons()
	
	#rotation_duration = stepify((rotation_duration - (0.3 * moons.size())), 0.01)
	#print(rotation_duration)
	orbit_angle_offset += 2 * PI * delta / float(rotation_duration)
	orbit_angle_offset = wrapf(orbit_angle_offset, -PI, PI)
	_update_moons()


func _update_moons():
	if moons.size() != 0:
		var spacing = 2 * PI / float(moons.size())
		for i in moons.size():
			var new_position = Vector2()
			new_position.x = cos(spacing * i + orbit_angle_offset) * radius.x
			new_position.y = sin(spacing * i + orbit_angle_offset) * radius.y
			moons[i].position = new_position


func _find_moons():
	moons = []
	for child in get_children():
		if child.is_in_group("moons"):
			moons.append(child)
