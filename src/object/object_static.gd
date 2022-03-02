extends KinematicBody2D

class_name object

export var team = 1

export var hp = 1000

var attackers = 0

var armor = 0

func _physics_process(delta):
	if (hp < 0):
		queue_free()
	
	if ((attackers - armor) > 0):
		hp -= attackers - armor
