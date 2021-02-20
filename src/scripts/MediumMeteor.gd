#extends KinematicBody2D
extends "res://src/scripts/Meteor.gd"

func _ready() -> void:
	MAX_SPEED = 225
	damage = 10
	health = 3
	score = 10
	#Events.connect("player_hit_meteor", self, "_on_Player_player_hit_meteor")
	#Events.connect("moon_hit_meteor", self, "_on_Moon_moon_hit_meteor")

	
#func _on_Player_player_hit_meteor(body) -> void:
#	if self.name == body.name:
#		die()


func _on_Moon_moon_hit_meteor(body) -> void:
	if self.name == body.name:
		health -= 1
		if health <= 0:
			die()
	








