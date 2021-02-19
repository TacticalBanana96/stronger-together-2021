extends KinematicBody2D

const ACCELERATION = 2000
const MAX_SPEED = 300
var _velocity = Vector2.ZERO
var damage = 5

func _ready() -> void:
	_velocity.x = -MAX_SPEED
	Events.connect("player_hit_meteor", self, "_on_Player_player_hit_meteor")
	Events.connect("moon_hit_meteor", self, "_on_Moon_moon_hit_meteor")
	
func _on_VisibilityNotifier2D_screen_exited() -> void:
	Events.emit_signal("damage_done", damage)
	die()
	
func _on_Player_player_hit_meteor(name) -> void:
	if self.name == name:
		die()


func _on_Moon_moon_hit_meteor(name) -> void:
	if self.name == name:
		die()
	
func _on_HitDetector_body_entered(body: Node) -> void:
	# TODO: Check to make sure moon or player hit the enemy
	pass

func _physics_process(delta: float) -> void:
	_velocity.y = move_and_slide(_velocity, Vector2.UP).y

func die() -> void:
	get_node("CollisionShape2D").disabled = true
	queue_free()







