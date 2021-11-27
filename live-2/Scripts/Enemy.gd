extends RigidBody2D

export(float) var hit_cooldown = 1.0

var current_cooldown = 0.0

func _physics_process(delta):
	var player_group = get_tree().get_nodes_in_group("player")
	if len(player_group) == 0:
		return
	
	var player = player_group[0]
	var difference = player.global_position - self.global_position
	self.linear_velocity = difference
	
	# Killing the player
	if current_cooldown <= 0.0:
		var bodies = self.get_colliding_bodies()
		for body in bodies:
			if body.is_in_group("player"):
				body.health -= 1
				current_cooldown = hit_cooldown
	
	current_cooldown -= delta
