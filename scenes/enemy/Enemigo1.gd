extends KinematicBody2D



func delete():
	queue_free()
	pass


func _on_AreaMuerte_area_entered(area):
	delete()
	pass
