extends Area2D

# Rutas a la UI (Asegúrate de que existan en la escena del mundo)
@onready var panel_texto: Control = $"../InterfazUI/Panel"
@onready var label_texto: Label = $"../InterfazUI/Panel/Label"

@export_multiline var texto_cartel: String = "Este es un letrero de prueba."

var jugador_cerca: bool = false

func _ready() -> void:
	if is_instance_valid(panel_texto):
		panel_texto.hide()
		
	# Conexión limpia de señales internas
	body_entered.connect(_al_entrar)
	body_exited.connect(_al_salir)

func _unhandled_input(event: InputEvent) -> void:
	if jugador_cerca and event.is_action_pressed("ui_accept"):
		if is_instance_valid(panel_texto) and is_instance_valid(label_texto):
			if panel_texto.visible:
				panel_texto.hide()
			else:
				label_texto.text = texto_cartel
				panel_texto.show()
			
			# Marca el evento como manejado para evitar conflictos
			get_viewport().set_input_as_handled()

func _al_entrar(body: Node2D) -> void:
	if body is CharacterBody2D:
		jugador_cerca = true

func _al_salir(body: Node2D) -> void:
	if body is CharacterBody2D:
		jugador_cerca = false
		if is_instance_valid(panel_texto):
			panel_texto.hide()
