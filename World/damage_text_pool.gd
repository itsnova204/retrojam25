extends Node2D

var damage_label_scene = preload("res://Utility/DamageText.tscn")
@export var float_speed: float = 50
@export var fade_time: float = 1.01
@export var max_labels: int = 50
@export var min_labels: int = 5

var labels: Array = []

func _ready():
	for i in range(min_labels):
		var label = damage_label_scene.instantiate()
		label.visible = false
		add_child(label)
		labels.append(label)

func show_damage(amount: int, color:Color,position: Vector2):
	var label = get_free_label()
	if not label and labels.size() < max_labels:
		# dynamically create a new label
		label = damage_label_scene.instantiate()
		label.visible = false
		add_child(label)
		labels.append(label)

	if label:
		label.float_speed = float_speed
		label.show_damage(amount, color, fade_time)
		label.global_position = position
	else:
		print("No free labels available!")

func get_free_label() -> Label:
	for label in labels:
		if not label.visible:
			return label
	return null
