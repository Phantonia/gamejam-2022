extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var speed = 4.2 * 6.9
var movementInput = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movementInput = Vector2(0, 0)
	
	if Input.is_key_pressed(KEY_A):
		movementInput += Vector2(-1, 0)
	if Input.is_key_pressed(KEY_D):
		movementInput += Vector2(1, 0)
	if Input.is_key_pressed(KEY_W):
		movementInput += Vector2(0, -1)
	if Input.is_key_pressed(KEY_S):
		movementInput += Vector2(0, 1)
		
	movementInput = movementInput.normalized()
		
func _physics_process(delta):
	move_and_collide(movementInput * speed)
