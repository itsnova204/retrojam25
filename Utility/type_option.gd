extends ColorRect

@onready var lblName = $lbl_name
@onready var lblDescription = $lbl_description
@onready var lblLevel = $lbl_level
@onready var itemIcon = $ColorRect

var mouse_over = false

@onready var player = get_tree().get_first_node_in_group("player")
const typeChart = preload("res://Utility/typechart.gd")

var type  = null

signal selected_type(type)

func _ready():
	connect("selected_type",Callable(player,"change_type"))
	if type == null:
		type =1 

	lblName.text = type
	itemIcon.color = typeChart.get_type_color(typeChart.Types[type])
	
func _input(event):
	if event.is_action("click"):
		if mouse_over:
			emit_signal("selected_type",type)

func _on_mouse_entered():
	mouse_over = true

func _on_mouse_exited():
	mouse_over = false
