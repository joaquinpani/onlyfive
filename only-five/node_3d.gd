extends Node3D

@export var velocidad: float = 5.0

@export var p1: Node3D
@export var p2: Node3D
@export var p3: Node3D
@export var p4: Node3D
@export var p5: Node3D # Punto final al completar las 5 vueltas

# --- NUEVAS VARIABLES PARA LOS DIÁLOGOS ---
@export var dialogo_advertencia: DialogueResource
@export var dialogo_agradecimiento: DialogueResource
var veces_molestado: int = 0
# ------------------------------------------

var puntos: Array = []
var indice_destino: int = 0
var direccion: int = 1 # 1 avanza, -1 retrocede
var en_movimiento: bool = false
var puede_reaccionar: bool = true

var vueltas_completadas: int = 0
var yendo_a_p5: bool = false
var finalizado: bool = false # <-- NUEVA VARIABLE PARA SELLAR EL OBJETO

func _ready() -> void:
	puntos = [p1, p2, p3, p4]

func _process(delta: float) -> void:
	if not en_movimiento:
		return
		
	var destino: Vector3
	
	if yendo_a_p5:
		if p5 == null:
			return
		destino = p5.global_position
	else:
		if puntos.is_empty() or puntos[indice_destino] == null:
			return
		destino = puntos[indice_destino].global_position

	destino.y = global_position.y # Mantiene la altura fija
	
	# Movimiento eficiente
	global_position = global_position.move_toward(destino, velocidad * delta)
	
	# Si llega al destino actual
	if global_position.distance_to(destino) < 0.05:
		global_position = destino 
		
		if yendo_a_p5:
			$dualsenseusablpro/AudioStreamPlayer3D.stop()
			en_movimiento = false
			finalizado = true # <-- LE DECIMOS QUE YA MURIÓ Y NO DEBE VOLVER A SONAR
			visible = false # ¡Desaparece al llegar al punto 5!
			set_process(false) # Detiene el _process para que se quede ahí fijo y termine
			print("DEBUG: ¡Llegó al punto 5, desapareció y finalizó por completo!")
			
			# --- NUEVO: CHAT FILEMÓN AGRADECIMIENTO ---
			if dialogo_agradecimiento:
				DialogueManager.show_dialogue_balloon(dialogo_agradecimiento, "start")
				$"../CSGBox3D30/AnimationPlayer".play("new_animation")
				$"../../ParedMoviendose".play()
				$dualsenseusablpro/AudioStreamPlayer3D.stop()
			# ------------------------------------------
		else:
			siguiente_punto()

func siguiente_punto() -> void:
	indice_destino += direccion
	
	# Control de límites circulares y conteo exacto de vueltas
	if indice_destino >= puntos.size():
		indice_destino = 0
		if direccion == 1:
			vueltas_completadas += 1
			print("DEBUG: ¡Vuelta completada! Llevamos ", vueltas_completadas, " de 5 vueltas.")
	elif indice_destino < 0:
		indice_destino = puntos.size() - 1
		if direccion == -1:
			vueltas_completadas += 1
			print("DEBUG: ¡Vuelta completada (en reversa)! Llevamos ", vueltas_completadas, " de 5 vueltas.")
		
	# Si completa las 5 vueltas sin interrupciones, va al punto 5
	if vueltas_completadas >= 2:
		yendo_a_p5 = true
		print("DEBUG: ¡5 vueltas alcanzadas! Abandonando circuito y directo al punto 5...")

func _on_zona_evasion_body_entered(body: Node3D) -> void:
	if finalizado:
		return # <-- SI YA LLEGÓ AL FINAL, IGNORA AL JUGADOR POR COMPLETO

	if body.is_in_group("player"):
		if not en_movimiento:
			# Primera vez que arranca
			
			$dualsenseusablpro/AudioStreamPlayer3D.play()
			en_movimiento = true
			indice_destino = 0
			direccion = 1
			vueltas_completadas = 0
			yendo_a_p5 = false
			print("DEBUG: Iniciando recorrido desde el inicio.")
		elif en_movimiento and puede_reaccionar and not yendo_a_p5:
			# ¡El jugador lo molestó! Invierte sentido y REINICIA el contador a 0
			direccion *= -1
			indice_destino += direccion
			
			if indice_destino >= puntos.size():
				indice_destino = 0
			elif indice_destino < 0:
				indice_destino = puntos.size() - 1
			
			vueltas_completadas = 0
			print("DEBUG: ¡Objeto molestado por el jugador! Contador de vueltas reiniciado a 0. Cambiando dirección.")
			
			# --- NUEVO: CONTADOR DE MOLESTIAS Y CHAT FILEMÓN ADVERTENCIA ---
			veces_molestado += 1
			if veces_molestado == 3:
				if dialogo_advertencia:
					DialogueManager.show_dialogue_balloon(dialogo_advertencia, "start")
			# ---------------------------------------------------------------
			
			# Cooldown breve para evitar bucles de activación seguidos
			puede_reaccionar = false
			await get_tree().create_timer(0.4).timeout
			puede_reaccionar = true
