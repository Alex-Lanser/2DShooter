extends CharacterBody2D

var motionspeed = 500

func _ready():
	pass
func _physics_process(delta):
	velocity = Vector2.ZERO
	
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
