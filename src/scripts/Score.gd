extends Node2D
var currentScore

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentScore = 0
	#TODO: make sure moon is child of player before awarding this point
	Events.connect("score_increased", self, "_on_score")


func _on_score(scoreIncrease):
	var score = 5
	#if body.is_in_group("meteors"):
	#	score = 5
	#elif body.is_in_group("medium_meteors"):
	#	score = 10
	#elif body.is_in_group("large_meteors"):
	#	score = 20
	#else:
	#	score = 0
	#	print('Collision not mapped', body.name)
	
	currentScore += score
	
	Events.emit_signal("score_updated", currentScore)
	

