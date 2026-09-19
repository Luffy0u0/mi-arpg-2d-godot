extends Area2D

@onready var panel_texto = $"../InterfazUI/Panel"
@onready var label_texto = $"../InterfazUI/Panel/Label"

var jugador_cerca: bool = false
@export_multiline var texto_cartel: String = "Este es un letrero de prueba."

func _ready() -> void:
	panel_texto.hide()
	# Conexión automática por código
	body_entered.connect(_al_entrar)
	body_exited.connect(_al_salir)

func _unhandled_input(event: InputEvent) -> void:
	if jugador_cerca and event.is_action_pressed("ui_accept"):
		if panel_texto.visible:
			panel_texto.hide()
		else:
			label_texto.text = texto_cartel
			panel_texto.show()

func _al_entrar(body: Node2D) -> void:
	if body is CharacterBody2D:
		jugador_cerca = true

func _al_salir(body: Node2D) -> void:
	if body is CharacterBody2D:
		jugador_cerca = false
		panel_texto.hide()
