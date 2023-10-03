extends CharacterBody2D

var motionspeed = 500
var bullet_speed = 5000
var bullet = preload("res://Bullet.tscn")
var bullet_count = 30
var shot = true

func _ready():
	pass

func _physics_process(delta):
	velocity = Vector2.ZERO
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1

	velocity = velocity * motionspeed
	move_and_slide()
	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("shoot"):
		fire()
			
	if Input.is_action_just_pressed("reload"):
		await get_tree().create_timer(1.0).timeout
		bullet_count = 30
		
	if Input.is_action_pressed("sprint"):
		motionspeed = 500
	else:
		motionspeed = 300
		
func fire():
	print("Mouse button")
	var bullet_instance = bullet.instantiate()
	bullet_instance.rotation_degrees = rotation_degrees - 90
	bullet_instance.position = get_global_position() + Vector2(40, 0).rotated(rotation)
	bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().add_child(bullet_instance)
	bullet_count -= 1


func kill():
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(body):
	#if "Enemy" in name.bol
	pass
