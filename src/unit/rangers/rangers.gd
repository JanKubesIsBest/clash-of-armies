extends unit


class_name rangers

export var strenght = 100 #power, what will be used on projectile
export var projectile = ""

export var fire_rate = 5
var timer = 0

var can_fire = false
export var use_your_range = true

func _physics_process(delta):
	timer += delta
	if can_fire and timer >= fire_rate:
		fire(projectile, self.strenght)
		timer = 0

func fire(projectile, strenght):
	if (can_fire):
		var projectile_instance = projectile.instance()
		print("fire")
		projectile_instance.position.x += 30 * self.team
		projectile_instance.position.y -= 32
		
		projectile_instance.rotation_degrees = rotation_degrees
		
		projectile_instance.apply_impulse(Vector2(), Vector2(strenght * self.team, strenght).rotated(rotation))
		
		add_child(projectile_instance)
