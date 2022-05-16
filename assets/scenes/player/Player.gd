extends KinematicBody2D


const max_speed = 500
const SPEED = 200
var velocity = Vector2()
var gravity = 10

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
		
		
	if !is_on_floor():
		
		
		if direccion != Vector2():
			speed += acc * delta
		else:
			speed -= desa * delta
		
		
		
		speed = clamp(speed, 0, max_speed)
		
		target_motion = speed * direccion.normalized()*delta
		
		steering = target_motion - motion
		
		
		if steering.length()>1:
			steering = steering.normalized()
			
		motion += steering / masa
		
		if speed == 0:
			motion = Vector2()
			
		move_and_collide(motion)
		
		if motion != Vector2():
			target_motion=atan2(motion.x,motion.y) +PI/2
			rotation = -target_angle
			
		
	pass
		
		
func _physics_process(delta):
	
	movimiento(delta)
	gravedad()
	
	
	pass
