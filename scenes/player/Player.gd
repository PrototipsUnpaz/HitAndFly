extends KinematicBody2D


const max_speed = 20
const SPEED = 300
var velocity = Vector2()
var gravity = 20

func gravedad():
	velocity.y += gravity


func _physics_process(delta):
	
	
	gravedad()
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	
	if Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity.x = 0
		velocity.y = 0
	
	if !is_on_floor():
		if Input.is_action_pressed("ui_left"):
			velocity.x = min(velocity.x - 20, max_speed)
		else:
			if Input.is_action_pressed("ui_right"):
				velocity.x +=20
	
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
	
	pass
