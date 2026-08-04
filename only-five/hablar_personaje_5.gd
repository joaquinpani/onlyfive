extends StaticBody3D
var usable = true

	
func interactuar():
	$"../../carnaval/hablar personaje5/ChakongBabaYagaDanceHalloweenMelodySpookyGuitarVintageFilm255731".play()
	usable = false
	
	#DialogueManager.show_example_dialogue_balloon(load("res://dialogos/alien.dialogue"), "start")
	

		
