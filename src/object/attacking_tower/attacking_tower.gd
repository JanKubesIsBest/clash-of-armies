extends base

signal bomber_can_fire
signal bomber_cant_fire

func _ready():
	type = "attacking_tower"
	$hp.text = "hp: " + str(self.hp)  
	
	$bomber.team = self.team
	
	if (team == -1):
		$KinematicBody2D.set_collision_mask_bit(1, true)
		$KinematicBody2D.set_collision_layer_bit(2, true)
		
		$left_range.set_collision_layer_bit(2, true)
		$right_range.set_collision_layer_bit(2, true)
	else:
		$KinematicBody2D.set_collision_mask_bit(2, true)
		$KinematicBody2D.set_collision_layer_bit(1, true)
		
		$left_range.set_collision_layer_bit(1, true)
		$right_range.set_collision_layer_bit(1, true)
	
	$KinematicBody2D.add_to_group("object")
	
	print($bomber.team)

func _physics_process(delta):
	$hp.text = "hp: " + str(self.hp)  


func _on_base_body_entered(body):
	if (!body.is_in_group("object")):
		attackers += 1

func _on_base_body_exited(body):
	if (!body.is_in_group("object")):
		attackers -= 1


func _on_left_range_body_entered(body):
	if (!body.is_in_group("object")):
		print("can_fire on left side")
		emit_signal("bomber_can_fire")


func _on_right_range_body_entered(body):
	if (!body.is_in_group("object")):
		print("can_fire on right side")
		emit_signal("bomber_can_fire")


func _on_left_range_body_exited(body):
	if (!body.is_in_group("object")):
		print("cant_fire on leftside")
		emit_signal("bomber_cant_fire")

func _on_right_range_body_exited(body):
	if (!body.is_in_group("object")):
		emit_signal("bomber_cant_fire")
		print("cant_fire on right side")
