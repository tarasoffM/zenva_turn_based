extends Sprite2D

var bob_amount : float = 0.01
var bob_speed : float = 10.0

@onready var base_offset : Vector2 = offset
var shake_intensity : float = 0.0
var shake_damping : float = 10.0

func _ready():
	var character = get_parent()
	character.OnTakeDamage.connect(_damage_visual)
	
func _process(delta):
	var t = Time.get_unix_time_from_system()
	var y_scale = 1 + (sin(t * bob_speed)) * bob_amount
	scale.y = y_scale
	
	if shake_intensity > 0:
		shake_intensity = lerpf(shake_intensity, 0, shake_damping * delta)
		offset = base_offset + _random_offset()

func _damage_visual (health : int):
	modulate = Color.RED
	shake_intensity = 10
	await get_tree().create_timer(0.05).timeout
	modulate = Color.WHITE
	
func _random_offset () -> Vector2:
	var x = randf_range(-shake_intensity, shake_intensity)
	var y = randf_range(-shake_intensity, shake_intensity)
	return Vector2(x, y)
