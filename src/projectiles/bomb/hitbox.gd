extends Area2D



func _on_RigidBody2D_bomb():
	print("enable hit box")
	#hodne divny chovani
	$CollisionShape2D.scale.x = 7
	$CollisionShape2D.scale.y = 7
	




func _on_RigidBody2D_quefree():
	$CollisionShape2D.scale.x = 1
	$CollisionShape2D.scale.y = 1
