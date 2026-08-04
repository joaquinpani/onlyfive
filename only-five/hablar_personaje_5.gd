extends StaticBody3D
var usable = true

	
func interactuar():
	$"../../entrada/hablar personaje5/ChakongBabaYagaDanceHalloweenMelodySpookyGuitarVintageFilm255731".play()
	usable = false
	
	DialogueManager.show_example_dialogue_balloon(load("res://circus.dialogue"), "start")
	

		
