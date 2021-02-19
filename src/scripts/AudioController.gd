extends Node

onready var backgroundMusic = get_node("AudioStreamPlayer")
onready var moonCollectedSound  = get_node("MoonCollected")
onready var explosionSound = get_node("Explosion")



func _ready() -> void:
	Events.connect("player_hit_meteor", self, "_play_explosion_sound")
	Events.connect("moon_hit_meteor", self, "_play_explosion_sound")
	Events.connect("collected_moon", self, "_play_collected_sound")
	


func _process(delta: float) -> void:
	if backgroundMusic.playing == false:
		backgroundMusic.play()

func _play_explosion_sound(name):
	print("EXPLOSION")
	explosionSound.play()

func _play_collected_sound(name):
	print("COLLECTED")
	moonCollectedSound.play()
