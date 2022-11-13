extends Area2D

signal picked_up(collectible);

var player = null

func _ready():
	pass

func _on_Player_pick_up():
	if player != null:
		emit_signal("picked_up", self)


func _on_collectible_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func _on_collectible_body_exited(body):
	if body.is_in_group("Player"):
		player = null
