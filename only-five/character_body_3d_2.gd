extends CharacterBody3D

@export var velocidad: float = 3.0
@export var jugador: Node3D # <-- ¡Arrastra a tu jugador aquí en el Inspector!

# Gravedad básica
var gravedad: float = 9.8
func _ready() -> void:
	$Sprite3D2/AnimationPlayer.play("new_animation")
func _physics_process(delta: float) -> void:
	# Si por alguna razón el jugador no está asignado o desaparece, no hacemos nada
	if not jugador:
		return

	# 1. Calculamos la dirección hacia el jugador
	var direccion = global_position.direction_to(jugador.global_position)
	
	# 2. Hacemos que la dirección en 'Y' sea cero para que el enemigo no intente volar
	direccion.y = 0 
	direccion = direccion.normalized()

	# 3. Hacemos que el enemigo mire hacia el jugador (opcional, pero se ve cool)
	if direccion != Vector3.ZERO:
		# Guardamos la posición del jugador pero a la altura del enemigo para que no mire arriba/abajo
		var posicion_mirar = Vector3(jugador.global_position.x, global_position.y, jugador.global_position.z)
		look_at(posicion_mirar, Vector3.UP)

	# 4. Aplicamos la velocidad
	velocity.x = direccion.x * velocidad
	velocity.z = direccion.z * velocidad
	
	# 5. Aplicamos gravedad si no está tocando el piso
	if not is_on_floor():
		velocity.y -= gravedad * delta
		
	# 6. ¡A moverse!
	move_and_slide()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and $".".visible == true:
		GameManager.darker = true
		$"../CanvasLayer/Control2/AnimationPlayer".play("new_animation")
		$"../Atrapado".play()
		$"../CharacterBody3D".position = Vector3(22.79,3.171,-62.8)
	pass # Replace with function body.
