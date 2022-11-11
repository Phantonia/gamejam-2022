extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var speed = 15 #4.2 * 6.9
var movementInput = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_mouse_angle():
	var direction = get_global_mouse_position() - global_position
	return atan2(direction.y, direction.x) + PI/2
	 

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
	
	self.rotation = get_mouse_angle()
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("attack!")
		
func _physics_process(delta):
	move_and_collide(movementInput * speed)
