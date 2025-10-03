extends Node

enum Types {WATER, LIGHTNING, EARTH, GRASS, FIRE, NORMAL}

const Chart = [ [-0.5, 2.0, 0.5, 0.5, 0.0, 0.8], [0.0, -0.5, 2.0, 0.5, 0.5, 0.8], [0.5, 0.0, -0.5, 2.0, 0.5, 0.8], [0.5, 0.5, 0.0, -0.5, 2.0, 0.8], [2.0, 0.5, 0.5, 0.0, -0.5, 0.8], [0.8, 0.8, 0.8, 0.8, 0.8, 1.0], ]

static func get_multiplier(attacker: Types, defender: Types) -> float:
	return Chart[defender][attacker]
