extends Node2D

var mission : int
var dream : bool

func _ready():
	randomize()
	GlobalVariables.level += 1
	
	mission = randi() % 2 + 1
	dream = randi() % 2 == 1
	
	var removeCount = $nazis.get_child_count() - nazi_count_for_level(GlobalVariables.level)
	print("removeCount = " + str(removeCount))
	for i in range(removeCount):
		var index = randi() % $nazis.get_child_count()
		$nazis.get_child(index).queue_free()

func nazi_count_for_level(level):
	var minCount = 4
	var slope = 2
	return min($nazis.get_child_count(), minCount + slope * level)
