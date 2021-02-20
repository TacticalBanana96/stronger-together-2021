extends Control

onready var lifeBar = $Bars/Bar
onready var scoreCounter = $Counters/Counter

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.connect("health_updated", lifeBar, "_on_heath_updated")
	Events.connect("score_updated", scoreCounter, "_on_score_updated")


