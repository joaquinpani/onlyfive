extends StaticBody3D

var usable = true

func interactuar():
	usable = false
	$palanca/AnimationPlayer.play("Cube_001Action")
	$"../Node/CSGBox3D16/AnimationPlayer".play("moverpues")
	
	
	
	$"../PalancaBaja".play()
	
	$"../ParedMoviendose".play()
	
