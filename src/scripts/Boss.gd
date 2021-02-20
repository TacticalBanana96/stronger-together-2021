extends "res://src/scripts/Meteor.gd"

func _ready() -> void:
	MAX_SPEED = 100
	damage = 20
	health = 3
	score = 20
	_velocity.x = -MAX_SPEED
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
	




