extends StaticBody3D
var usable = true
func _ready() -> void:
	$Sprite3D/AnimationPlayer.play("new_animation")
func interactuar():
	usable = false
	DialogueManager.show_example_dialogue_balloon(load("res://dialogos/dark.dialogue"), "start")
	
