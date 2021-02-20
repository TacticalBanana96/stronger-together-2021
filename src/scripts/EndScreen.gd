extends Control

onready var endMessage: Label = $Label 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var message = "The solar system has been destroyed "
	if PlayerData.score >= 50 && PlayerData.score < 200:
		message = "The solar system will be permanently scarred by this battle"
	if PlayerData.score >= 200:
		message = "The solar system has been saved :) Congrats"	
	endMessage.text = message + "\n\n	final score: %s" % [PlayerData.score]



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
