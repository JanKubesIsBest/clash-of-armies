extends KinematicBody2D

class_name unit

var velocity = Vector2.ZERO
export var speed = 300
var can_move = 1


export var hp = 100
export var dmg_from_fire = 0

export var team = 1

var number_of_attackers = 0

func _physics_process(delta):
	
	velocity.x = speed * team * can_move
	
	hp -= number_of_attackers
	if (hp < 1):
		queue_free()
	
	
	move_and_slide(velocity, Vector2.UP)
