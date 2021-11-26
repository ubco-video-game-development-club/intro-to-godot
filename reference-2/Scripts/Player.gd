extends KinematicBody2D

export(float) var move_speed = 64
export(float) var rot_offset_degrees = 90

onready var sprite = $Sprite
onready var rot_offset = deg2rad(rot_offset_degrees)

func _physics_process(_delta):
	var movement = get_movement() * move_speed
	var _v = self.move_and_slide(movement)
	
	# Make player face the mouse
	var rotation = get_rotation()
	sprite.rotation = rotation
	
	# Round position to avoid in-between pixel jitter
	var pos = self.position
	self.position = Vector2(round(pos.x), round(pos.y))

func get_movement():
	var m = Vector2(0, 0)
	
	if Input.is_action_pressed("move_left"):
		m.x -= 1
	if Input.is_action_pressed("move_right"):
		m.x += 1
	if Input.is_action_pressed("move_up"):
		m.y -= 1
	if Input.is_action_pressed("move_down"):
		m.y += 1
	
	return m.normalized()

func get_rotation():
	var mouse_pos = get_local_mouse_position()
	return mouse_pos.angle() + rot_offset
