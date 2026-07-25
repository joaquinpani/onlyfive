extends StaticBody3D
var usable = true

func interactuar():
	usable = false
	DialogueManager.show_example_dialogue_balloon(load("res://dialogos/filemon.dialogue"), "start")
	
