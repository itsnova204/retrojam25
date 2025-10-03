extends Area2D

@export_enum("Cooldown","HitOnce","DisableHitBox") var HurtBoxType = 0

const TypeChart = preload("res://Utility/typechart.gd")

@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableTimer

signal hurt(damage, angle, knockback)

var target
var hit_once_array = []

func _on_area_entered(area):
	if not area.is_in_group("attack"):
		return
	if area.get("damage")==null:
		return

	match HurtBoxType:
		0: #Cooldown
			collision.call_deferred("set","disabled",true)
			disableTimer.start()
		1: #HitOnce
			if hit_once_array.has(area) == false:
				hit_once_array.append(area)
				if area.has_signal("remove_from_array"):
					if not area.is_connected("remove_from_array",Callable(self,"remove_from_list")):
						area.connect("remove_from_array",Callable(self,"remove_from_list"))
			else:
				return
		2: #DisableHitBox
			if area.has_method("tempdisable"):
				area.tempdisable()
	
	var angle = Vector2.ZERO
	var knockback = 1
	
	var typeDef = TypeChart.Types.NORMAL
	if target.get("type") != null:
		typeDef = target.type
		
	var typeAtk = TypeChart.Types.NORMAL
	if area.get("type") != null:
		typeAtk = area.type

	var damage = area.damage * TypeChart.get_multiplier(typeAtk, typeDef)

	if not area.get("angle") == null:
		angle = area.angle
	if not area.get("knockback_amount") == null:
		knockback = area.knockback_amount
	
	emit_signal("hurt",damage, angle, knockback)
	if area.has_method("enemy_hit"):
		area.enemy_hit(1)
		
	var pool = get_tree().current_scene.get_node("DamageTextPool")
	print("damage for ", typeAtk," vs ", typeDef,": ", TypeChart.get_multiplier(typeAtk, typeDef), " - ", TypeChart.get_color(typeAtk, typeDef) )
	pool.show_damage(damage, TypeChart.get_color(typeAtk, typeDef),global_position + Vector2(0, -20))

func remove_from_list(object):
	if hit_once_array.has(object):
		hit_once_array.erase(object)

func _on_disable_timer_timeout():
	collision.call_deferred("set","disabled",false)
