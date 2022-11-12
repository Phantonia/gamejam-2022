extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 1
var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	move_and_collide(velocity)

func launch(startPos: Vector2, direction: Vector2):
	position = startPos
	var angle = Vector2(1, 0).angle_to(direction)
	rotation = angle + PI/2 # if we use a proper sprite remove PI/2
	velocity = direction.normalized() * speed
