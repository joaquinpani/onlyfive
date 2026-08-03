extends Node2D
var contador = 1
var contraseña = [4,1,3,2]
var input = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D/AnimationPlayer.play("disonancia activa")
	$Node2D/Label2/AnimationPlayer.play("parpadeo")
	$Sprite2D3/AnimationPlayer.play("bucle")
	$Node2D2/Node2D/AnimationPlayer.play("moverse")
	$Node2D2/Node2D2/AnimationPlayer.play("moverse")
	$Node2D2/Node2D3/AnimationPlayer.play("moverse")
	$Node2D3/Sprite2D/AnimationPlayer.play("cargando",-1,0.5)
	pass # Replace with function body.


func _on_boton_presionado() -> void:
	match contador:
		1:
			contador = contador+1
			$Node2D/Label2/AnimationPlayer.stop()
			$Node2D2/Node2D/Sprite2D4.show()
			$Node2D/Label6/AnimationPlayer.play("parpadeo")
			input.append(1)
			$Node2D/Label2/AnimationPlayer.play("RESET")
		2:
			contador = contador+1
			$Node2D/Label6/AnimationPlayer.stop()
			$Node2D2/Node2D2/Sprite2D4.show()
			$Node2D/Label7/AnimationPlayer.play("parpadeo")
			input.append(1)
			$Node2D/Label6/AnimationPlayer.play("RESET")
		3:
			contador = contador+1
			$Node2D/Label7/AnimationPlayer.stop()
			$Node2D2/Node2D3/Sprite2D4.show()
			$Node2D/Label8/AnimationPlayer.play("parpadeo")
			input.append(1)
			$Node2D/Label7/AnimationPlayer.play("RESET")
		4:
			contador = contador+1
			input.append(1)
			$Sprite2D.show()
			comprobacion()
		5:
			pass
	pass # Replace with function body.


func _on_boton_2_presionado() -> void:
	match contador:
		1:
			contador = contador+1
			$Node2D/Label2/AnimationPlayer.stop()
			$Node2D2/Node2D/Sprite2D.show()
			$Node2D/Label6/AnimationPlayer.play("parpadeo")
			input.append(2)
			$Node2D/Label2/AnimationPlayer.play("RESET")
		2:
			contador = contador+1
			$Node2D/Label6/AnimationPlayer.stop()
			$Node2D2/Node2D2/Sprite2D.show()
			$Node2D/Label7/AnimationPlayer.play("parpadeo")
			input.append(2)
			$Node2D/Label6/AnimationPlayer.play("RESET")
		3:
			contador = contador+1
			$Node2D/Label7/AnimationPlayer.stop()
			$Node2D2/Node2D3/Sprite2D.show()
			$Node2D/Label8/AnimationPlayer.play("parpadeo")
			input.append(2)
			$Node2D/Label7/AnimationPlayer.play("RESET")
		4:
			contador = contador+1
			input.append(2)
			$Sprite2D.show()
			comprobacion()
		5:
			pass
	pass # Replace with function body.


func _on_boton_3_presionado() -> void:
	match contador:
		1:
			contador = contador+1
			$Node2D/Label2/AnimationPlayer.stop()
			$Node2D2/Node2D/Sprite2D2.show()
			$Node2D/Label6/AnimationPlayer.play("parpadeo")
			input.append(3)
			$Node2D/Label2/AnimationPlayer.play("RESET")
		2:
			contador = contador+1
			$Node2D/Label6/AnimationPlayer.stop()
			$Node2D2/Node2D2/Sprite2D2.show()
			$Node2D/Label7/AnimationPlayer.play("parpadeo")
			input.append(3)
			$Node2D/Label6/AnimationPlayer.play("RESET")
		3:
			contador = contador+1
			$Node2D/Label7/AnimationPlayer.stop()
			$Node2D2/Node2D3/Sprite2D2.show()
			$Node2D/Label8/AnimationPlayer.play("parpadeo")
			input.append(3)
			$Node2D/Label7/AnimationPlayer.play("RESET")
		4:
			contador = contador+1
			input.append(3)
			$Sprite2D.show()
			comprobacion()
		5:
			pass
	pass # Replace with function body.


func _on_boton_4_presionado() -> void:
	match contador:
		1:
			contador = contador+1
			$Node2D/Label2/AnimationPlayer.stop()
			$Node2D2/Node2D/Sprite2D3.show()
			$Node2D/Label6/AnimationPlayer.play("parpadeo")
			input.append(4)
			$Node2D/Label2/AnimationPlayer.play("RESET")
		2:
			contador = contador+1
			$Node2D/Label6/AnimationPlayer.stop()
			$Node2D2/Node2D2/Sprite2D3.show()
			$Node2D/Label7/AnimationPlayer.play("parpadeo")
			input.append(4)
			$Node2D/Label6/AnimationPlayer.play("RESET")
		3:
			contador = contador+1
			$Node2D/Label7/AnimationPlayer.stop()
			$Node2D2/Node2D3/Sprite2D3.show()
			$Node2D/Label8/AnimationPlayer.play("parpadeo")
			input.append(4)
			$Node2D/Label7/AnimationPlayer.play("RESET")
		4:
			contador = contador+1
			input.append(4)
			$Sprite2D.show()
			comprobacion()
		5:
			pass
	pass # Replace with function body.



func comprobacion():
	
	if input == contraseña:
		$"../../../../../../../AnimationPlayer".play("si",1.0)
	else:
		$"../../../../../../../AnimationPlayer".play("no",1.0)
		
func cargando():
	$Node2D3.show()
	$Label.hide()
	$Sprite2D.hide()
	$Node2D.hide()
	$Node2D2.hide()
	
func perder():
	$correcto.show()
	$correcto/AnimationPlayer.play("new_animation",-1,3.0)
	
func ganar():
	$correcto2.show()
	$correcto2/AnimationPlayer.play("new_animation",-1,3.0)
func despuesdeperder():
	$"../../../../../../../../../SpotLight3D3".light_color = Color.RED
func despuesdeganar():
	$"../../../../../../../../../../OmniLight3D16".show()
	$"../../../../../../../../../../Node/CSGBox3D52/AnimationPlayer".play("new_animation")
	$"../../../../../../../../../../ParedMoviendose".play()
	
