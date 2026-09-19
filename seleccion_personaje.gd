extends Control

func seleccionar_y_empezar(nombre_heroe: String):
	# Guardamos la elección en nuestro script global
	DatosJuego.personaje_seleccionado = nombre_heroe
	print("Personaje elegido: ", DatosJuego.personaje_seleccionado)
	
	# Cambia al mundo abierto al presionar cualquier héroe
	get_tree().change_scene_to_file("res://mundo_semi_abierto.tscn")

func _on_boton_heroe_1_pressed():
	seleccionar_y_empezar("Heroe1")

func _on_boton_heroe_2_pressed():
	seleccionar_y_empezar("Heroe2")

func _on_boton_heroe_3_pressed():
	seleccionar_y_empezar("Heroe3")

func _on_boton_heroe_4_pressed():
	seleccionar_y_empezar("Heroe4")
