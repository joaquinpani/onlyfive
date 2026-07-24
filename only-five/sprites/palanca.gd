extends Node3D
var usable = true

func interactuar():
	usable = false
	$AnimationPlayer.play("Cube_001Action")
