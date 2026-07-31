extends Sprite3D





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.darker == true:
		GameManager.darker = false
		darker()
	if GameManager.pages == 3:
		GameManager.pages = 0
		enddark()
	pass
func darker():
	GameManager.pages = 0
	$"../../Iniciodark".play()
	$"../../WorldEnvironment/Timer".start()
	$"../../WorldEnvironment".environment.ambient_light_color = Color.BLACK
	$"..".position = Vector3(21.68,0,-35.3)
	$"..".show()
	$"../../CharacterBody3D/Camera3D/SpotLight3D".show()
	$"../../zona2/CSGBox3D30/AnimationPlayer".play_backwards("new_animation")

func enddark():
	$"../../WorldEnvironment".environment.ambient_light_color = Color.BLACK
	$"../../CharacterBody3D/Camera3D/SpotLight3D".hide()
	$"../AudioStreamPlayer3D".hide()
	$"..".hide()
	$"../../zona2/CSGBox3D44/AnimationPlayer".play("new_animation")
	$"../../ParedMoviendose".play()
	$"../AudioStreamPlayer3D".stop()
	$"../../CanvasLayer/Label3".hide()
	

func _on_timer_timeout() -> void:
	$"../../pages".show()
	$"../../pages2".show()
	$"../../pages3".show()
	$"../../CanvasLayer/Label3".show()
	$"../AudioStreamPlayer3D".play()
	$"../../Linterna".play()
	$"../../hablar personaje3/Sprite3D".hide()
	pass # Replace with function body.
