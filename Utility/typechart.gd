extends Node

enum Types {WATER, LIGHTNING, EARTH, GRASS, FIRE, NORMAL}


const Chart = [ 
	[-0.5, 2.0, 0.8, 0.8, 0.0, 0.8], 
	[0.0, -0.5, 2.0, 0.8, 0.8, 0.8], 
	[0.8, 0.0, -0.5, 2.0, 0.8, 0.8], 
	[0.8, 0.8, 0.0, -0.5, 2.0, 0.8], 
	[2.0, 0.8, 0.8, 0.0, -0.5, 0.8], 
	[0.4, 0.4, 0.4, 0.4, 0.4, 1.0], 
]



static func get_type_color(type: Types) -> Color:
	match type:
		Types.WATER:
			return Color.BLUE
		Types.LIGHTNING:
			return Color.YELLOW
		Types.FIRE:
			return Color.RED
		Types.EARTH:
			return Color.SADDLE_BROWN
		Types.GRASS:
			return Color.LIME_GREEN
		Types.NORMAL:
			return Color.GRAY
		_:
			return Color.BLACK
			

static func get_multiplier(attacker: Types, defender: Types) -> float:
	return Chart[defender][attacker]

static func get_color(attacker: Types, defender: Types) -> Color:
	var multiplier = Chart[defender][attacker]
	match multiplier:
		2.0:
			return Color.RED
		1.2, 1.5:
			return Color.YELLOW
		0.5, 0.8:
			return Color.GRAY
		0.0:
			return Color.BLACK     
		_:
			return Color.WHITE
