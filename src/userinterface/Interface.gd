extends Control

onready var lifeBar = $Bars/Bar
onready var scoreCounter = $Counters/Counter
onready var pausedOverlay: ColorRect = $PausedOverlay 
onready var scene_tree: = get_tree()

var paused: = false setget set_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pausedOverlay.visible = value

func _ready() -> void:
	Events.connect("health_updated", lifeBar, "_on_heath_updated")
	Events.connect("score_updated", scoreCounter, "_on_score_updated")



