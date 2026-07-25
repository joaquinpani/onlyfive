extends StaticBody3D
var usable = true

	
func interactuar():
	
	DialogueManager.show_example_dialogue_balloon(load("res://dialogos/alien.dialogue"), "start")
	
func _process(delta: float) -> void:
	if GameManager.aliensi == true:
		GameManager.aliensi = false
		$"../Node/CSGBox3D20/AnimationPlayer".play("new_animation")
		$"../ParedMoviendose".play()
		
