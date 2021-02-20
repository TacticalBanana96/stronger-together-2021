extends KinematicBody2D

const ACCELERATION = 2000
var MAX_SPEED = 300
var _velocity = Vector2.ZERO
var damage = 5
var score = 5
var health = 1

func _ready() -> void: 
	_velocity.x = -MAX_SPEED
	Events.connect("player_hit_meteor", self, "_on_Player_player_hit_meteor")
	Events.connect("moon_hit_meteor", self, "_on_Moon_moon_hit_meteor")


func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	pass
	#Events.emit_signal("damage_done", damage)
	 # Replace with function body.

	
func _on_VisibilityNotifier2D_screen_exited() -> void:
	#Events.emit_signal("damage_done", damage)
	#die()
	pass
	
func _on_Player_player_hit_meteor(body) -> void:
	if self.name == body.name:
		die()

func _on_Moon_moon_hit_meteor(body) -> void:
	if self.name == body.name:
		health -= 1
		if health <= 0:
			die()

func _on_HitDetector_body_entered(body: Node) -> void:
	# TODO: Check to make sure moon or player hit the enemy
	pass

func _physics_process(delta: float) -> void:
	#if self.position.x == -1:
		#Events.emit_signal("damage_done", damage)
	if self.position.x < -100:
		Events.emit_signal("damage_done", damage)
		die()
	_velocity.y = move_and_slide(_velocity, Vector2.UP).y

func die() -> void:
	get_node("HitDetector/CollisionShape2D").disabled = true
	get_node("CollisionShape2D").disabled = true
	queue_free()








