extends Camera2D

export var decay = 0.8  # How quickly the shaking stops [0, 1].
export var max_offset = Vector2(100, 75)  # Maximum hor/ver shake in pixels.
export var max_roll = 0.1  # Maximum rotation in radians (use sparingly).

export (NodePath) var target  # Assign the node this camera will follow.

var trauma = 0.0  # Current shake strength.
var trauma_power = 2  # Trauma exponent. Use [2, 3].

func _ready():
	randomize()
	Events.connect("player_hit_meteor", self, "_on_Player_hit_meteor")
	Events.connect("score_increased", self, "_on_Moon_hit_meteor")

func _on_Player_hit_meteor(body):
	add_trauma(0.4) 

func _on_Moon_hit_meteor(scpreIncreased):
	add_trauma(0.3)

func add_trauma(amount):
	trauma = min(trauma + amount, 0.4)
	
func _process(delta):
	if target:
		global_position = get_node(target).global_position
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()

func shake():
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * rand_range(-1, 1)
	offset.x = max_offset.x * amount * rand_range(-1, 1)
	offset.y = max_offset.y * amount * rand_range(-1, 1)
