extends Node

var score := 0 setget set_score
 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.connect("score_updated", self, "set_score")

func set_score(currentScore: int) -> void:
	print("PLAYER DATA SCORE",score)
	score = currentScore
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
