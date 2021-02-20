extends Node

const METEOR = preload("res://src/actors/Meteor.tscn")
const MOON = preload("res://src/actors/Moon.tscn")
const MEDIUM_METEOR = preload("res://src/actors/MediumMeteor.tscn")

var rng = RandomNumberGenerator.new()
var meteorSpawnCount: int = 0
var moonSpawnCount: int = 0

var moonDeltaTime = 2.0
var meteorDeltaTime = 2.0

onready var meterorTimer = $MeteorTimer
onready var moonTimer = $MoonTimer
onready var mediumMeteorTimer = $MediumMeteorTimer

func _on_Timer_timeout() -> void:
	spawn(METEOR)
	
func _on_MoonTimer_timeout() -> void:
	spawn(MOON)
#	pass
func _on_MediumMeteorTimer_timeout() -> void:
	spawn(MEDIUM_METEOR)

#func _ready() -> void:
#	pass
	#set_wait_timers(moonDeltaTime, meteorDeltaTime)

func _process(delta: float) -> void:
	pass
	#if meteorSpawnCount > 0 && fmod(meteorSpawnCount, 30) == 0:
	#	meteorDeltaTime = meteorDeltaTime /2.0
	#	print("New TIMES", moonDeltaTime, meteorDeltaTime)
	#	set_wait_timers(moonDeltaTime, meteorDeltaTime)
	#	meteorSpawnCount = 0 
	#if moonSpawnCount > 0 && fmod(moonSpawnCount, 20) == 0:
	#	moonDeltaTime = moonDeltaTime / 2.0
	#	print("New TIMES", moonDeltaTime, meteorDeltaTime)
	#	set_wait_timers(moonDeltaTime, meteorDeltaTime) 
	#	moonSpawnCount = 0
		

func spawn(object):
	#1060 x       -32 -568 y
	var instanceOfObject = object.instance()
	if instanceOfObject.name == 'Moon':
		moonSpawnCount +=1
	elif instanceOfObject.name == 'Meteor':
		meteorSpawnCount += 1
		meterorTimer.wait_time = meteorDeltaTime
	elif instanceOfObject.name == 'MediumMeteor':
		meteorSpawnCount +=1
		mediumMeteorTimer.wait_time = 5.0
		
	var pos = Vector2()
	pos.x = 1020
	rng.randomize()
	pos.y = floor(rng.randf_range(32, 568))
	# check if another object is within 32 or 64 px of that space 
	instanceOfObject.set_position(pos)
	instanceOfObject.z_index = 1
	var spawnedContainer = get_node("Container") 
	spawnedContainer.add_child(instanceOfObject)


func set_wait_timers(moontime, meteorTime):
#	pass
	meterorTimer.wait_time = moontime
	moonTimer.wait_time = meteorTime






