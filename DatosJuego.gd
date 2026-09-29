extends Node

# Variables globales que se mantendrán entre escenas
var personaje_seleccionado: String = "Sora"
var posicion_jugador: Vector2 = Vector2.ZERO

# Función para guardar en el disco
func guardar_datos():
	var archivo = FileAccess.open("user://guardado.save", FileAccess.WRITE)
	if archivo:
		var datos = {
			"personaje": personaje_seleccionado,
			"pos_x": posicion_jugador.x,
			"pos_y": posicion_jugador.y
		}
		# Convertimos el diccionario a texto JSON y lo guardamos
		archivo.store_line(JSON.stringify(datos))
		archivo.close()
		print("¡Partida guardada con exito!")

# Función para cargar desde el disco
func cargar_datos():
	if FileAccess.file_exists("user://guardado.save"):
		var archivo = FileAccess.open("user://guardado.save", FileAccess.READ)
		var linea_texto = archivo.get_line()
		archivo.close()
		
		var json = JSON.new()
		var resultado = json.parse(linea_texto)
		if resultado == OK:
			var datos = json.data
			personaje_seleccionado = datos.get("personaje", "Sora")
			posicion_jugador = Vector2(datos.get("pos_x", 0), datos.get("pos_y", 0))
			print("¡Partida cargada con exito!")
