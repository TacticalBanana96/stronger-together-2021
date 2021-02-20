extends HBoxContainer

onready var healthBar = $TextureProgress

func _on_heath_updated(newHealth):
	healthBar.value = newHealth
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
