extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.002

# Referencia a la cámara (asegúrate de que el nodo se llame Camera3D dentro de tu Player)
@onready var camera = $Camera3D
@onready var raycast = $Camera3D/RayCast3D

func _ready() -> void:
	# Oculta y atrapa el ratón en la ventana para poder girar la vista libremente
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	# Si movemos el ratón, rotamos al jugador (horizontal) y la cámara (vertical)
	if GameManager.camara == true:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			# Gira todo el cuerpo del jugador hacia los lados (eje Y)
			rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
			
			# Gira solo la cámara hacia arriba y abajo (eje X)
			camera.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
			
			# Limita que la cámara no dé la vuelta completa hacia atrás
			camera.rotation.x = clamp(camera.rotation.x, -1.5, 1.5)
	else: 
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	# Detectar la tecla de interacción de forma independiente al movimiento del mouse
	if event.is_action_pressed("interactuar"):
		print("¡Tecla interactuar presionada!")
		
		# Verificamos si el raycast está chocando con algo
		if raycast.is_colliding():
			var objeto_mirado = raycast.get_collider()
			print("Mirando a: ", objeto_mirado.name)
			
			# Si el objeto tiene una función de interactuar, la ejecutamos
			if objeto_mirado.has_method("interactuar") and objeto_mirado.usable == true:
				objeto_mirado.interactuar()
				
		# Lanzamos el diálogo de Dialogue Manager
	if raycast.is_colliding():
			var objeto_mirado = raycast.get_collider()
			print("Mirando a: ", objeto_mirado.name)
			
			# Si el objeto tiene una función de interactuar, la ejecutamos
			if objeto_mirado.has_method("interactuar") and objeto_mirado.usable == true:
				$"../CanvasLayer/Puntero".self_modulate = "#fffffffc"
				$"../CanvasLayer/Puntero".scale = Vector2(0.015,0.015)
			else: 
				$"../CanvasLayer/Puntero".self_modulate = "#ffffff7f"
				$"../CanvasLayer/Puntero".scale = Vector2(0.01,0.01)
	else: 
		$"../CanvasLayer/Puntero".self_modulate = "#ffffff7f"
		$"../CanvasLayer/Puntero".scale = Vector2(0.01,0.01)
		
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("izquierda", "derecha", "adelante", "atras")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
