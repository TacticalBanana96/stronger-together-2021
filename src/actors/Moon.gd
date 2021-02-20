extends KinematicBody2D

const MAX_SPEED = 300
var _velocity = Vector2.ZERO
onready var audioStreamer = get_node("AudioStreamPlayer2D")

func _ready() -> void:
	_velocity.x = -MAX_SPEED
	Events.connect("collected_moon", self, "_on_Player_collected_moon")

func _on_Player_collected_moon(name) -> void:
	if(self.name == name):
		#audioStreamer.play()
		Events.emit_signal("grabbed_by_player", self.name)
		die()

func _on_Area2D_body_entered(body: Node) -> void:
	#print('COLLISION WITH MOON ',body.name)
	#print('COLLISION WITH MOON ',body.get_groups())
	if body.is_in_group("meteors") || body.is_in_group("medium_meteors"):
		Events.emit_signal("moon_hit_meteor", body)
		if self.get_parent().name == 'OrbitController':	
			Events.emit_signal("score_increased", body.score)
		die()


func _physics_process(delta: float) -> void:
	if self.position.x < -100:
		die()
	_velocity.y = move_and_slide(_velocity, Vector2.UP).y


func die() -> void:
	get_node("Area2D/CollisionShape2D").disabled = true
	get_node("CollisionShape2D").disabled = true
	queue_free()

