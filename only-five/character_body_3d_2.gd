extends CharacterBody3D

@export var velocidad: float = 3.0
@export var jugador: Node3D 


var gravedad: float = 9.8
func _ready() -> void:
	$Sprite3D2/AnimationPlayer.play("new_animation")
func _physics_process(delta: float) -> void:
	
	if not jugador:
		return

	
	var direccion = global_position.direction_to(jugador.global_position)
	
	
	direccion.y = 0 
	direccion = direccion.normalized()

	
	if direccion != Vector3.ZERO:
		
		var posicion_mirar = Vector3(jugador.global_position.x, global_position.y, jugador.global_position.z)
		look_at(posicion_mirar, Vector3.UP)

	
	velocity.x = direccion.x * velocidad
	velocity.z = direccion.z * velocidad
	
	
	if not is_on_floor():
		velocity.y -= gravedad * delta
		
	
	move_and_slide()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and $".".visible == true:
		GameManager.darker = true
		$"../CanvasLayer/Control2/AnimationPlayer".play("new_animation")
		$"../Atrapado".play()
		$"../CharacterBody3D".position = Vector3(22.79,3.171,-62.8)
	pass # Replace with function body.
