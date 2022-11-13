extends Sprite

var target

func _ready():
	target = get_parent().get_parent().get_node("collectible")

func _process(delta):
	var player = get_parent().get_parent().get_node("Player")
	var collec = get_parent().get_parent().get_node("collectible")
	var hqPos = get_parent().get_parent().get_node("hqPos")
	
	if collec == null:
		target = hqPos
	
	rotation = Vector2(1, 0).angle_to(player.position.direction_to(target.position))
