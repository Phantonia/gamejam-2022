extends Node2D


# Declare member variables here. Examples:
# var a = 2

var activeTexture

var toggleBool = false

export(Texture) var textureA
export(Texture) var textureB

export(Texture) var textureNormal

var player
var hasToggled = false

func toggleTexture():
	if activeTexture == textureA:
		activeTexture = textureB
	else:
		activeTexture = textureA
		
func updateTexture():
	if true:#GlobalVariables.last_mission_dream:
		$Sprite.texture = activeTexture
	else: 
		$Sprite.texture = textureNormal

# Called when the node enters the scene tree for the first time.
func _ready():
	activeTexture = textureA
	updateTexture()
	
	player = get_tree().get_nodes_in_group("player")[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset = player.global_position - global_position
	
	if (abs(offset.x) > 300 or abs(offset.y) > 200):
		if not hasToggled:
			toggleTexture()
			updateTexture() 
			hasToggled = true
	else:
		hasToggled = false
	
