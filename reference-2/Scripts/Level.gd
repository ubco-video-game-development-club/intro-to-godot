extends Node2D

export(float) var spawn_delay = 5.0
export(PackedScene) var enemy_prefab

var current_cooldown = spawn_delay

func _process(delta):
	current_cooldown -= delta
	if current_cooldown < 0.0:
		current_cooldown = spawn_delay
		spawn()

func spawn():
	var enemy = enemy_prefab.instance()
	self.add_child(enemy)
