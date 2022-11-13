extends Node2D

export(Array, Resource) var missions = []

var next_mission_index = 0
var mission_label
	

func next_mission():
	var mission = missions[next_mission_index]
	get_node("../CanvasLayer/MissionText").text = mission.text
	next_mission_index += 1
