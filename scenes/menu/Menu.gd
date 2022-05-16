extends Control


#al presionar boton jugar, este te lleva al escenario de prueba
func _on_Jugar_pressed():
	get_tree().change_scene("res://scenes/levels/TestScenario.tscn")
	pass

#al presionar salir, este boton te saca del juego
func _on_Salir_pressed():
	get_tree().quit()
	pass
