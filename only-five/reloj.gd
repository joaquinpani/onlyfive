extends Sprite2D
var minutos = 9
var segundos = 59

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("inicio")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_timer_timeout() -> void:
	if GameManager.muerte == false:
		segundos = segundos -1
		$Label2/Label3.text = str(segundos)
		if segundos == -1:
			segundos = 59
			$Label2/Label3.text = str(segundos)
		pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	if GameManager.muerte == false:
		if minutos > 0:
			$"../../Pasodeunminutazo".play()
			$AnimationPlayer.play("new_animation")
			minutos = minutos -1
			$Label2/Label.text = str(minutos)
		else:
			$Label2/Label.add_theme_color_override("font_color", Color.RED)
			$Label2/Label2.add_theme_color_override("font_color", Color.RED)
			$Label2/Label3.add_theme_color_override("font_color", Color.RED)
			
		pass # Replace with function body.

func _process(delta: float) -> void:
	if GameManager.mensajes > 0:
		$"../Label5".show()
		$"../Label5".text = str(GameManager.mensajes)
	else:
		$"../Label5".hide()
	if GameManager.muerte == false:
		if minutos == 0 and segundos > 59:
			$AnimationPlayer.speed_scale = 0.5
			$AnimationPlayer.play("tiempos e acaba")
			$Label2/Label.add_theme_color_override("font_color", Color.RED)
			$Label2/Label2.add_theme_color_override("font_color", Color.RED)
			$Label2/Label3.add_theme_color_override("font_color", Color.RED)
		if minutos == 0 and segundos > 10:
			$AnimationPlayer.speed_scale = 1
			$AnimationPlayer.play("tiempos e acaba")
			$Label2/Label.add_theme_color_override("font_color", Color.RED)
			$Label2/Label2.add_theme_color_override("font_color", Color.RED)
			$Label2/Label3.add_theme_color_override("font_color", Color.RED)
		if GameManager.maldeltiempo == true:
		
			if $Timer.wait_time != 0.05:
				$Timer.stop()
				$Timer2.stop()
				$Timer.wait_time = 0.05
				$Timer2.wait_time = 3.0
				$Timer.start()
				$Timer2.start()
		if minutos == 0 and segundos < 2:
			$"../../End".play()
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			GameManager.muerte = true
			$AnimationPlayer.play("muerte")
			for balloon in get_tree().get_nodes_in_group("dialogue_balloon"):
				balloon.queue_free()


func _on_texture_button_pressed() -> void:
	$"../../End".play()
	
	$AnimationPlayer.play("restart")
	pass # Replace with function body.
	
func denuevo():
	GameManager.palancaaparecer = false
	GameManager.onlyfiveaparece = false
	GameManager.camara = true
	GameManager.personaje_actual = 1
	GameManager.llave = false
	GameManager.darker = false
	GameManager.pages = 0
	GameManager.aliensi = false
	GameManager.maldeltiempo = false
	GameManager.muerte = false
	GameManager.mensajes = 0
	GameManager.cinematic = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().change_scene_to_file("res://escenario 1.tscn")
	
func gameover():
	$"../../Gameover".play()
	
func segudnaso():
	$"../../Unsegundito".play()
