extends KinematicBody2D

var velocidad = 70
var movimiento  = Vector2(0,0)
var Forgod = true
var Gravedad = 20


func _physics_process(_delta):
	
	if is_on_wall():
		Forgod = not Forgod
	
	if Forgod == true:
		movimiento.x = 50
		$AnimatedSprite.play("Fly")
		$CollisionShape2D.position.x = 1
		$AnimatedSprite.flip_h = false
	
	
	

	else:
		movimiento.x = -50
		$AnimatedSprite.play("Fly")
		$AnimatedSprite.flip_h = true

	movimiento.y += Gravedad
	
	movimiento = move_and_slide(movimiento, Vector2.UP)
	
	movimiento.x = lerp(movimiento.x, 0, 0.2)
	
	
	
	
func _on_Area2D_area_entered(_area):
	if area.is_in_group("player"):
		get_tree().reload_current_scene()
