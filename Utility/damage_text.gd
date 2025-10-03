extends Label

var lifetime: float = 0.0
@export var float_speed: float = 50

func show_damage(amount: int, duration: float = 1.0):
	text = str(amount)
	lifetime = duration
	modulate.a = 1.0
	visible = true

func _process(delta: float) -> void:
	if visible and lifetime > 0.0:
		position.y -= float_speed * delta
		modulate.a = lifetime / 1.0  # simple fade
		lifetime -= delta
	elif visible and lifetime <= 0.0:
		visible = false  # hide for reuse
