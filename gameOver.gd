extends Node2D

func _ready():
	var msg = ""
	
	var success = GlobalVariables.last_mission_success
	var dream = GlobalVariables.last_mission_dream
	
	if success:
		msg += "Mission completed successfully! "
	else:
		msg += "Mission failed! "
		
	if not dream:
		msg += "That was reality."
	elif success:
		msg += "Unfortunately, that was a dream and you helped the regime."
	else:
		msg += "Fortunately, that was a dream and you didn't help the regime."
		
	if success != dream:
		msg += " You reached level " + str(GlobalVariables.level + 1)
	
	$label.text = msg

func _input(event):
	if false and event is InputEventKey:
		yield(get_tree().create_timer(.5), "timeout")
		get_tree().change_scene("res://game.tscn")
