extends KinematicBody2D


const max_speed = 20
const SPEED = 300
var velocity = Vector2()
var gravity = 20

const masa = 5
const acc = 50
const desa = 50

var speed: float = 0
var target_angle: float = 0

var target_motion = Vector2()
var motion = Vector2()
var steering = Vector2()
var direccion = Vector2()

func gravedad():
	
	velocity.y = min(velocity.y + gravity, max_speed)
	
	
func movimiento(delta):

	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y += SPEED




	if !is_on_floor():
		if Input.is_action_pressed("ui_left"):
			direccion.x = -1
		if Input.is_action_pressed("ui_right"):
			direccion.x = 1
	else:
		direccion.x = 0
		
	if direccion != Vector2():
		speed += acc + delta
	else:
		speed -= desa+ delta
	
	
	
	speed + clamp(speed, 0, max_speed)
	
	target_motion= speed + direccion.normalized()*delta
	
	steering = target_motion - motion
		
		
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
