extends base

func _ready():
	type = "miner"
	self.hp = 400
	$hp.text = "hp: " + str(self.hp)  
	
	if (team == -1):
		$KinematicBody2D.set_collision_mask_bit(1, true)
		$KinematicBody2D.set_collision_layer_bit(2, true)
		
	else:
		$KinematicBody2D.set_collision_mask_bit(2, true)
		$KinematicBody2D.set_collision_layer_bit(1, true)
	
	$KinematicBody2D.add_to_group("object")


func _physics_process(delta):
	$hp.text = "hp: " + str(self.hp)  


func _on_base_body_entered(body):
	if (!body.is_in_group("object")):
		attackers += 1

func _on_base_body_exited(body):
	if (!body.is_in_group("object")):
		attackers -= 1
