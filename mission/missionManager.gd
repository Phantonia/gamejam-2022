extends Node2D

export(Array, Resource) var missions = []

var next_mission_index = 0
var mission_label

func _ready():
	mission_label  = get_tree().get_nodes_in_group("mission_statement")[0]



func next_mission():
	var mission = missions[next_mission_index]
	
	mission_label.text = mission.text
	
	next_mission_index += 1
