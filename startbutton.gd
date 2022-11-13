extends TextureButton

func _pressed():
	print("k")
	get_tree().change_scene("res://game.tscn")

#var mouse = get_global_mouse_position()
#var rect = Rect2($CollisionShape2D.position , $CollisionShape2D.shape.extents * 2)

#func _input(event):
#	if event is InputEventMouseButton and event.pressed and $CollisionShape2D.shape is RectangleShape2D:
#		var rect = Rect2($CollisionShape2D.position , $CollisionShape2D.shape.extents * 2)
#		print(event.position)
#		print(rect)
#
#		if event is NOTIFICATION_WM_MOUSE_ENTER:
#		#if rect.has_point(event.position):
#			get_tree().change_scene("res://game.tscn")

#func _input(event):
#	if mouse is rect:
#		if event is InputEventMouseButton and event.pressed:
#			print("moin")
#			get_tree().change_scene("res://game.tscn")
#		var rect = Rect2($CollisionShape2D.position , $CollisionShape2D.shape.extents * 2)
#		print(event.position)
#		print(rect)
#
#		#if event is NOTIFICATION_WM_MOUSE_ENTER:
#		if rect.has_point(event.position):
#			get_tree().change_scene("res://game.tscn")




















# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
