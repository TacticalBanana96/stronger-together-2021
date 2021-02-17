extends KinematicBody2D

const ACCELERATION = 2000
const MAX_SPEED = 300
var _velocity = Vector2.ZERO

func _ready() -> void:
	_velocity.x = -MAX_SPEED
	
func _on_VisibilityNotifier2D_screen_exited() -> void:
	die()

func _on_HitDetector_body_entered(body: Node) -> void:
	# TODO: Check to make sure moon or player hit the enemy
	if body.is_in_group("moons"):
		die()
	

func _physics_process(delta: float) -> void:
	_velocity.y = move_and_slide(_velocity, Vector2.UP).y

func die() -> void:
	get_node("CollisionShape2D").disabled = true
	queue_free()


