extends RigidBody2D

var player

func _ready():
	var p_group = get_tree().get_nodes_in_group("player");
	if len(p_group) > 0:
		player = p_group[0]

func _physics_process(delta):
	if player == null:
		return
	
	var d = player.global_position - self.global_position
	self.linear_velocity = d
