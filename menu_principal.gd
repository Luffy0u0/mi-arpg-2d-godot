extends Control

func _on_boton_nueva_partida_pressed():
	# Nos enviará a la escena de Selección de Personaje que haremos a continuación
	get_tree().change_scene_to_file("res://seleccion_personaje.tscn")

func _on_boton_salir_pressed():
	# Cierra la aplicación
	get_tree().quit()
