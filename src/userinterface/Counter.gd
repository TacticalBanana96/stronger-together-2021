extends NinePatchRect

onready var numberLabel = $Label

func _on_score_updated(newScore):
	numberLabel.text = str(newScore)

func _ready() -> void:
	pass # Replace with function body.



