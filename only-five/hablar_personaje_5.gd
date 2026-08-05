extends StaticBody3D
var usable = true

	
func interactuar():
	$"../../entrada/hablar personaje5/ChakongBabaYagaDanceHalloweenMelodySpookyGuitarVintageFilm255731".play()
	usable = false
	
	DialogueManager.show_example_dialogue_balloon(load("res://circus.dialogue"), "start")
	

		
func _process(delta: float) -> void:
	if GameManager.movercirco == true:
		$"../../entrada/hablar personaje5/AnimationPlayer".play("moverse")
		GameManager.movercirco = false
		$"../../SpotLight3D6".hide()
		$"../../SpotLight3D7".show()
		$"../../entrada/AnimatableBody3D".queue_free()
