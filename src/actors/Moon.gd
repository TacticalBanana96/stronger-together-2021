extends KinematicBody2D

const ACCELERATION = 2000
const MAX_SPEED = 300
const FRICTION = 300
var _velocity = Vector2.ZERO
var direction: = Vector2(-1, 0)

var rotation_point = Vector2(593.782,252.839)
var rotation_around_point = 0
var distance_from_point = 100

func _process(delta):
	# set the position to the point
	global_position = rotation_point
	# offset using the rotation
	global_position += Vector2(cos(rotation_around_point), sin(rotation_around_point)) * distance_from_point

#func _physics_process(delta: float) -> void:

#	var point = Vector2(593.782,252.839)
#	transform.basis.rotated()
#	orbit(point, )
	#if direction != Vector2.ZERO:
	#	_velocity = _velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	#else:
	#	_velocity = Vector2.move_toward(Vector2.ZERO, FRICTION * delta)
		
#	move()


func move() -> void:
	move_and_slide(_velocity)

func orbit(point, axis, angle) -> void:

	# Get transform
	var trans = transform

	# Rotate its basis
	var rotated_basis = trans.basis.rotated(axis, angle)

	# Rotate its origin
	var rotated_origin = point + (trans.origin - point).rotated(axis, angle)

	# Set the result back
	transform = Transform(rotated_basis, rotated_origin)

func die() -> void:
	queue_free()
