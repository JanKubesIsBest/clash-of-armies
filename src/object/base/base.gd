extends base

#assets
const red_base = preload("res://src/object/base/assets/red.png")
const blue_base = preload("res://src/object/base/assets/blue_base.png")


#units
const soldier_scen = preload("res://src/unit/soldier/soldier.tscn")
const bomber_scen = preload("res://src/unit/rangers/bomber/bomber.tscn")

#objects
const miner = preload("res://src/object/miner/miner.tscn")
const attacking_tower = preload("res://src/object/attacking_tower/attacking_tower.tscn")

var number_of_objects = 0

#economy 
var number_of_miners = 0
var gold = 1000

func _ready():
	if (team == -1):
		$KinematicBody2D.set_collision_mask_bit(1, true)
		$KinematicBody2D.set_collision_layer_bit(2, true)
		
		$Sprite.texture = blue_base
	else:
		$KinematicBody2D.set_collision_mask_bit(2, true)
		$KinematicBody2D.set_collision_layer_bit(1, true)
		
		$Sprite.texture = red_base
		
	$KinematicBody2D.add_to_group("object")

func _physics_process(delta):
	$hp.text = "Hp: " + str(hp)
	$gold.text = "Gold: " + str(gold)
	
	
	gold += (2 + number_of_miners) * delta
	
	if Input.is_action_just_pressed("player_" + str(team) + "_create_soldier") and gold > 20:
		gold -= 20
		
		print("soldier_created " + str(team))
		
		var soldier_instance = soldier_scen.instance()
		
		set_instance(self.team, soldier_instance, false, true)
		
	if Input.is_action_just_pressed("bomber_" + str(team)) and gold > 10:
		gold -= 30
		
		var bomber_instance = bomber_scen.instance()
		
		
		set_instance(self.team, bomber_instance, false, false)
	if Input.is_action_just_pressed("miner_player" + str(team)) and gold > 10:
		gold -= 10
		
		var miner_instance = miner.instance()
		
		number_of_miners += 1
		number_of_objects += 1
		
		print(miner_instance.position)
		print(self.position)
		
		set_instance(self.team, miner_instance, true, true)
		
		
		
		$number_of_miners.text = "Number_of_miners: " + str(number_of_miners)
	if Input.is_action_just_pressed("attacking_tower" + str(team)) and gold > 30:
		gold -= 30
		
		var attacking_tower_instance = attacking_tower.instance()
		
		number_of_objects += 1
		
		set_instance(self.team, attacking_tower_instance, true, true)
		


func _on_Area2D_body_entered(body):
	if (!body.is_in_group("object")):
		attackers += 1

func _on_Area2D_body_exited(body):
	if (!body.is_in_group("object")):
		attackers -= 1

func someone_died(is_miner):
	if (is_miner == "miner"):
		number_of_miners -= 1
	
	number_of_objects -= 1
	$number_of_miners.text = "Number_of_miners: " + str(number_of_miners)

func set_instance(team, instance, is_object, set_mask):
		instance.position.x = 0
		instance.position.y = 0
		
		instance.position.x += 80 * team
		instance.team = team
		if (team == -1):
			instance.set_collision_layer_bit(2, true)
			if set_mask:
				instance.set_collision_mask_bit(1, true)
			
		else:
			instance.set_collision_layer_bit(1, true)
			if set_mask:
				instance.set_collision_mask_bit(2, true)
		if (is_object):
			instance.connect("I_died", self, "someone_died")
			instance.position.x *= number_of_objects + 1
		add_child(instance)
		
