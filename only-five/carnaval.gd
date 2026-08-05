extends Node3D





func _on_area_3d_presionado() -> void:
	$"../pulpo/SpotLight3D".show()
	$FreesoundfxSpotlightTurningOn388828.play()
	$Timer2.start()
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	$"../CharacterBody3D".position = Vector3(-12.0,2.941,-51.1)
	
	pass # Replace with function body.
