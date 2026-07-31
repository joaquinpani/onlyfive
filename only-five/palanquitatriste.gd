extends StaticBody3D

var usable = true

func interactuar():
	usable = false
	$"../zona2/pared/AnimationPlayer".play_backwards("moverse")
	$palanca/AnimationPlayer.play("Cube_001Action")
	$"../PalancaBaja".play()
	$"../zona2/pared/Sprite3D".hide()
	$"../ParedMoviendose".play()
	$"../zona2/pared/OmniLight3D14".hide()
