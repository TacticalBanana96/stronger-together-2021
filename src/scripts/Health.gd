extends Node2D
const MAX_HEALTH = 100
var currentHealth

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentHealth = MAX_HEALTH
	Events.connect("damage_done", self, "_on_damage")


func _on_damage(amount):
	if (currentHealth - amount) < 0: 
		#TODO signal game over
		Events.emit_signal("game_over")
		currentHealth = 0
	else: 
		currentHealth -= amount
	print("Current health", currentHealth)
	Events.emit_signal("health_updated", currentHealth)
	



