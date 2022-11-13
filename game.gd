extends Node2D

var dream : bool

var picked_up = false

func _ready():
	randomize()
	
	$MissionManager.next_mission()
	
	if GlobalVariables.last_mission_success:
		GlobalVariables.level += 1
	
	
	if GlobalVariables.level == 1:
		dream = true
	elif GlobalVariables.level == 2:
		dream = false
	else:
		dream = randi() % 2 == 1
	
	GlobalVariables.last_mission_dream = dream
	
	print("Level " + str(GlobalVariables.level))
	print("Dream = " + str(dream))
	
	var removeCount = $nazis.get_child_count() - nazi_count_for_level(GlobalVariables.level)
	print("Remove " + str(removeCount) + " nazis to get to " + str(nazi_count_for_level(GlobalVariables.level)))
	for i in range(removeCount):
		while true:
			var index = randi() % $nazis.get_child_count()
			var child = $nazis.get_child(index)
			if child.is_in_group("Nazi"):
				child.queue_free()
				$nazis.remove_child(child)
				break
		
	#$"CanvasLayer/nazisLeft".text = str(get_nazi_count()) + " Nazis left"

func nazi_count_for_level(level):
	var minCount = 30
	var slope = 2
	return min($nazis.get_child_count(), minCount + slope * level)


func _on_collectible_picked_up(collectible: Area2D):
	remove_child(collectible)
	collectible.position = Vector2(350, 30)
	$CanvasLayer.add_child(collectible)
	picked_up = true
	

func drop_collectible(collectible: Area2D):
	$CanvasLayer.remove_child(collectible)
	collectible.position = Vector2(-10000, -10000)
	add_child(collectible)
	picked_up = false

func _on_hqPos_body_entered(body):
	print("entered hqPos")
	if body.is_in_group("Player"):
		if picked_up: #and get_nazi_count() == 0:
			if $MissionManager.done():
				GlobalVariables.last_mission_success = true
				get_tree().change_scene("res://gameOver.tscn")
			else:
				drop_collectible(get_node("CanvasLayer/collectible"))
				$MissionManager.next_mission()

func get_nazi_count() -> int:
	var count = 0
	
	for i in $nazis.get_children():
		if i.is_in_group("Nazi"):
			count += 1
	
	return count

func _on_nazis_nazi_died():
	$"CanvasLayer/nazisLeft".text = str(get_nazi_count()) + " Nazis left"
	print($nazis.get_children())
