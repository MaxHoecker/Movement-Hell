class_name Health
extends Node

@export var health: int: set = set_health, get = get_health

func set_health(value: int):
	health = value
	
func get_health():
	return health
