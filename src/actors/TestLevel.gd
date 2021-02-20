tool
extends Node2D

export var nextScreen: PackedScene

onready var explosionAudioPlayer:= $Audio/Explosion

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.connect("game_over", self, "on_game_over")
	
func _get_configuration_warning() -> String:
	return "nextScreen must be set for button to work" if not nextScreen else ""
	
func on_game_over() -> void:
	yield(explosionAudioPlayer, "finished")
	get_tree().change_scene_to(nextScreen)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
