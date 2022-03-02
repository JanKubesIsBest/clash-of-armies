extends Area2D

class_name base

signal I_died(type)

export var team = 1

export var hp = 1000

var attackers = 0

var armor = 0

var type = ""

func _ready():
	add_to_group("object")

func _physics_process(delta):
	if (hp < 0):
		emit_signal("I_died", type)
		queue_free()
	
	if ((attackers - armor) > 0):
		hp -= attackers - armor
