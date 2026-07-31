extends StaticBody3D

var usable = true

func interactuar():
	usable = false
	$palanca/AnimationPlayer.play("Cube_001Action")
	$"../Node/CSGBox3D5/AnimationPlayer".play("moverse")
	$"../OmniLight3D13".hide()
	$"../PalancaBaja".play()
	$"../Node/Label3D".hide()
	$"../ParedMoviendose".play()
	$"../Node/Label3D2".show()
