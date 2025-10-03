extends Node

enum Types {WATER, LIGHTNING, EARTH, GRASS, FIRE, NORMAL}

const Chart = [ 
	[-0.5, 2.0, 0.5, 0.5, 0.0, 0.8], 
	[0.0, -0.5, 2.0, 0.5, 0.5, 0.8], 
	[0.5, 0.0, -0.5, 2.0, 0.5, 0.8], 
	[0.5, 0.5, 0.0, -0.5, 2.0, 0.8], 
	[2.0, 0.5, 0.5, 0.0, -0.5, 0.8], 
	[0.8, 0.8, 0.8, 0.8, 0.8, 1.0], 
]

static func get_multiplier(attacker: Types, defender: Types) -> float:
	return Chart[defender][attacker]

static func get_color(attacker: Types, defender: Types) -> Color:
	var multiplier = Chart[defender][attacker]
	match multiplier:
		2.0:
			return Color(1, 0, 0) 
		1.2, 1.5:
			return Color(1,1,0)
		0.5, 0,8:
			return Color(0.5, 0.5, 0.5) 
		0.0:
			return Color(0, 0, 0)       
		_:
			return Color(1, 1, 1)  
