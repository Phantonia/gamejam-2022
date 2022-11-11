extends KinematicBody2D


var hp = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if hp <= 0:
		get_parent().remove_child(self)

func get_hit():
	hp -= 1
