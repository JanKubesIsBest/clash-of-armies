extends projectile

signal bomb
signal quefree

var exploded_num = 0

func _ready():
	type = "bomb"

func _physics_process(delta):
	
	if (exploded):
		exploded_num += 1
		print(delta)
	if exploded and exploded_num == 1:
		pass
		#emit_signal("quefree")
	

func _on_stopping_hit_box_body_entered(body):
	print("explode")
	emit_signal("bomb")
	exploded = true
	$AnimationPlayer.play("explosion")
	self.gravity_scale = 0
	self.sleeping = true


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
