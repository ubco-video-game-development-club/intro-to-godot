extends RigidBody2D

func _physics_process(_delta):
	var bodies = self.get_colliding_bodies()
	if len(bodies) > 0:
		for body in bodies:
			if body.is_in_group("enemy"):
				body.queue_free()
		
		self.queue_free()
