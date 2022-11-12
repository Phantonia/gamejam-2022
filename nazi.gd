extends KinematicBody2D


var hp = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if hp <= 0:
		die()

func get_hit():
	var splatter = preload("res://bloodSplatter.tscn").instance()
	add_child(splatter)
	splatter.global_position = global_position
	hp -= 1
	
func die():
	get_parent().remove_child(self)
