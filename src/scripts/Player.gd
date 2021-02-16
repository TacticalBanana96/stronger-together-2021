extends KinematicBody2D

const ACCELERATION = 2000
const MAX_SPEED = 300
const FRICTION = 300
var _velocity = Vector2.ZERO

		
func _physics_process(delta: float) -> void:
	
	var direction: = get_direction()
	if direction != Vector2.ZERO:
		_velocity = _velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	else:
		_velocity = Vector2.move_toward(Vector2.ZERO, FRICTION * delta)
	move()
	
func get_direction() -> Vector2:
	return Vector2(
	int(Input.get_action_strength("move_right")) - int(Input.get_action_strength("move_left")),
	int(Input.get_action_strength("move_down")) - int(Input.get_action_strength("move_up"))
	).normalized()

func move() -> void:
	move_and_slide(_velocity)

func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	acceleration: int
) -> Vector2:
	var out = linear_velocity
	out = acceleration * direction.normalized()
	return out

func die() -> void:
	queue_free()
