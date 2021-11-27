extends RigidBody2D

func _physics_process(_delta):
	if len(self.get_colliding_bodies()) > 0:
		self.queue_free()
