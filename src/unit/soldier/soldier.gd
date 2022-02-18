extends unit

func _ready():
	print(team)
	if (team == -1):
		$Area2D.set_collision_layer_bit(2, true)

	else:
		$Area2D.set_collision_layer_bit(1, true)

func _physics_process(delta):
	$TextEdit.text = str(hp)
	

func _on_Area2D_body_entered(body):
	print("Is attacking mr " + str(team * -1))
	
	can_move = 0
	print(body.is_in_group("object"))
	if (!body.is_in_group("object")):
		number_of_attackers += 1

func _on_Area2D_body_exited(body):
	
	can_move = 1
	if (!body.is_in_group("object")):
		number_of_attackers -= 1


func _on_fire_hitbox_area_entered(area):
	print("Bomb")
	hp -= dmg_from_fire
