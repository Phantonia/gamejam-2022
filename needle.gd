extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_parent().get_parent().get_node("Player")
	var collec = get_parent().get_parent().get_node("collectible")
	rotation = Vector2(1, 0).angle_to(player.position.direction_to(collec.position))
