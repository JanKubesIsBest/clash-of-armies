extends rangers

func _ready():
	projectile = preload("res://src/projectiles/bomb/bomb.tscn")
	

	if (team == -1):
		$Area2D.set_collision_layer_bit(2, true)
		$range.set_collision_layer_bit(2, true)
	else:
		$Area2D.set_collision_layer_bit(1, true)
		$range.set_collision_layer_bit(1, true)

func _physics_process(delta):
	$hp.text = str(hp)

func _on_attacking_tower_bomber_cant_fire():
	can_fire = false

func _on_attacking_tower_bomber_can_fire():
	can_fire = true


func _on_range_body_entered(body):
	if use_your_range:
		can_fire = true
		speed = 0

func _on_range_body_exited(body):
	if use_your_range:
		can_fire = false
		speed = 300


func _on_Area2D_body_entered(body):
	if (!body.is_in_group("object")):
		number_of_attackers += 1



func _on_Area2D_body_exited(body):
	if (!body.is_in_group("object")):
		number_of_attackers -= 1

