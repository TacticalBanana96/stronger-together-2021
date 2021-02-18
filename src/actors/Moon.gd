extends KinematicBody2D

signal grabbed_by_player()
signal moon_hit_meteor()

const ACCELERATION = 2000
const MAX_SPEED = 300
const FRICTION = 300
var _velocity = Vector2.ZERO
var direction: = Vector2(-1, 0)

var rotation_point = Vector2(593.782,252.839)
var rotation_around_point = 0
var distance_from_point = 100

func _on_Player_collected_moon() -> void:
	emit_signal("grabbed_by_player")
	die()

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("meteors"):
		emit_signal("moon_hit_meteor")
		die()
	#elif body.is_in_group("player"):
		# TODO: check if this can become child of player
		#emit_signal("grabbed_by_player")
		#die()

#func _process(delta):
	# set the position to the point
#	global_position = rotation_point
	# offset using the rotation
#	global_position += Vector2(cos(rotation_around_point), sin(rotation_around_point)) * distance_from_point

#func _physics_process(delta: float) -> void:

#	var point = Vector2(593.782,252.839)
#	transform.basis.rotated()
#	orbit(point, )
	#if direction != Vector2.ZERO:
	#	_velocity = _velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	#else:
	#	_velocity = Vector2.move_toward(Vector2.ZERO, FRICTION * delta)
		
#	move()


#func move() -> void:
#	move_and_slide(_velocity)


func die() -> void:
	get_node("Area2D/CollisionShape2D").disabled = true
	get_node("CollisionShape2D").disabled = true
	queue_free()





