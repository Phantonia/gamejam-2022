extends KinematicBody2D


var hp = 3
var shoots = false
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var rnd = randf()
	print(rnd)
	if rnd <= 0.5:
		$Sprite.texture = load("res://assets/Nazi/Nazi+Weapon+Weihnachten-Pixel.png")
	
func _process(delta):
	if hp <= 0:
		die()
	if player != null:
		pass
#		rotation = Vector2(0, -1).angle_to(position.direction_to(player.position))

func get_hit():
	var splatter = preload("res://bloodSplatter.tscn").instance()
	add_child(splatter)
	splatter.global_position = global_position
	hp -= 1
	
func die():
	queue_free()
	
func start_shooting(player):
	shoots = true
	self.player = player
	$Timer.start()

func stop_shooting():
	shoots = false
	player = null
	$Timer.stop()

func _on_Radius_body_entered(body):
	if body.is_in_group("Player"):
		start_shooting(body)


func _on_Radius_body_exited(body):
	if body.is_in_group("Player"):
		stop_shooting()


func _on_Timer_timeout():
	var bulletScene = load("res://bullet.tscn")
	var bullet = bulletScene.instance()
	var dir = position.direction_to(player.position)
	var randomAngle = randf() * PI / 12 - PI / 24
	dir = dir.rotated(randomAngle)
	rotation = Vector2(0, -1).angle_to(dir) + deg2rad(-5)
	bullet.launch(position + 20 * dir, dir)
	get_parent().add_child(bullet)


func _on_HitBox_body_entered(body):
	if body.is_in_group("Bullet") and body != self:
		body.queue_free()
