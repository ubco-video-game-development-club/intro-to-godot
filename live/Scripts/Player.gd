extends KinematicBody2D

export(float) var move_speed = 64.0

func _physics_process(delta):
	var movement = get_movement() * move_speed
	self.move_and_slide(movement)
	
	var pos = self.position
	self.position = Vector2(round(pos.x), round(pos.y))

func get_movement():
	var m = Vector2(0, 0)
	
	if Input.is_action_pressed("move_up"):
		m.y -= 1
	if Input.is_action_pressed("move_down"):
		m.y += 1
	if Input.is_action_pressed("move_left"):
		m.x -= 1
	if Input.is_action_pressed("move_right"):
		m.x += 1
	
	return m.normalized()
