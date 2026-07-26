extends StaticBody3D
var usable = true

	
func interactuar():
	$"../../Recoger".play()
	if GameManager.llave == true:
		
		usable = false
		$"../../ParedMoviendose".play()
		$"../AnimationPlayer".play("new_animation")
	else:
		$"../../hablar personaje6/AnimationPlayer".play("new_animation")
		usable = false
	

	
		
