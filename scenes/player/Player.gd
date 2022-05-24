extends KinematicBody2D

const NORMAL_VECTOR = Vector2(0,-1);
const MAX_VERTICAL_SPEED = 500
const MAX_HORIZONTAL_SPEED = 500
const VERTICAL_SPEED = 200
const HORIZONTAL_SPEED = 20
var velocity = Vector2()
var gravity = 10

func movimiento(delta):
	velocity = move_and_slide(velocity, NORMAL_VECTOR)
	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = max(velocity.y - VERTICAL_SPEED, -MAX_VERTICAL_SPEED)

	if !is_on_floor():
		if Input.is_action_pressed("ui_left"):
			velocity.x =  max(velocity.x - HORIZONTAL_SPEED, -MAX_HORIZONTAL_SPEED)
		if Input.is_action_pressed("ui_right"):
			velocity.x =  min(velocity.x + HORIZONTAL_SPEED, MAX_HORIZONTAL_SPEED)
	else:
		velocity.x = 0
		
func gravedad():
	velocity.y = min(velocity.y + gravity, MAX_VERTICAL_SPEED)

func _physics_process(delta):
	movimiento(delta)
	gravedad()
