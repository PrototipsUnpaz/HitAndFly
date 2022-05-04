extends KinematicBody2D


func _on_Area2D_area_entered(area):
	delete()
	pass
func delete():
	queue_free()
	pass
