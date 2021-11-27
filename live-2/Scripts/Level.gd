extends Node2D

export(float) var cooldown_time = 5.0
export(PackedScene) var enemy_prefab

var current_cooldown = 0.0

func _process(delta):
	if current_cooldown <= 0.0:
		spawn()
		current_cooldown = cooldown_time
	
	current_cooldown -= delta

func spawn():
	var enemy = enemy_prefab.instance()
	enemy.position = Vector2.ZERO
	self.add_child(enemy)
