extends KinematicBody2D

signal health_changed(value)
signal pick_up()

# Declare member variables here. Examples:
# var a = 2
var speed = 420 #15 #4.2 * 6.9
var movementInput = Vector2(0, 0)

var naziInRange = null

var maxhp = 10
var hp = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_mouse_angle():
	var direction = get_global_mouse_position() - global_position
	# mouse angle is angle of machete, not angle of pc eyes
	return atan2(direction.y, direction.x) + deg2rad(60)
	 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp <= 0:
		GlobalVariables.last_mission_success = false
		get_tree().change_scene("res://gameOver.tscn")
	
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
			attack()
	if event.is_action_pressed("ui_select"):
		emit_signal("pick_up")
			
func attack():
	$WeaponAttachment.rotation = -1
	yield(get_tree().create_timer(.1), "timeout")
	$WeaponAttachment.rotation = 0
	if (naziInRange != null):
		naziInRange.get_hit()
func _physics_process(delta):
	move_and_slide(movementInput * speed)

func _on_WeaponAttachment_body_entered(body):
	if is_nazi(body):
		naziInRange = body


func _on_WeaponAttachment_body_exited(body):
	if is_nazi(body):
		naziInRange = null
	
func is_nazi(body):
	return body.is_in_group("Nazi")

func get_hit():
	hp -= 1
	emit_signal("health_changed", float(hp) / float(maxhp))


func _on_HitBox_body_entered(body):
	if body.is_in_group("Bullet"):
		get_hit()
		body.queue_free()
