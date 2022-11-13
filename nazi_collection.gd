extends Node2D

signal nazi_died()

func _ready():
	pass
	
func _process(delta):
	pass

func _on_nazis_child_exiting_tree(node):
	if node.is_in_group("Nazi"):
		emit_signal("nazi_died")
