extends Node2D
var currentScore

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentScore = 0
	Events.connect("moon_hit_meteor", self, "_on_score")


func _on_score(score):
	currentScore += score
	Events.emit_signal("score_updated", currentScore)
	

