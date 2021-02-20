extends KinematicBody2D

const MOON = preload("res://src/actors/Moon.tscn")
const ACCELERATION = 2000
const MAX_SPEED = 400
const FRICTION = 300
var _velocity = Vector2.ZERO

func _ready() -> void:
	Events.connect("grabbed_by_player", self, "_on_Moon_grabbed_by_player")
	var animationPlayer = $AnimationPlayer
	animationPlayer.play("idle")

func _on_Moon_grabbed_by_player(name) -> void:
	spawnMoon()

func _on_MeteorDetector_body_entered(body: Node) -> void:
	#print('COLLISION WITH PLAYER ',body.name)
	#print('COLLISION WITH PLAYER ',body.get_groups())
	if body.is_in_group("meteors"):
		Events.emit_signal("player_hit_meteor" , body)
		Events.emit_signal("game_over")
		die()
	if body.is_in_group("moons") && !is_a_parent_of(body):
		Events.emit_signal("collected_moon", body.name)
		
	
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
	get_node("CollisionShape2D").disabled = true
	queue_free()

func spawnMoon() -> void:
	var moon = MOON.instance()
	var orbitController = get_node("OrbitController")
	orbitController.add_child(moon)



