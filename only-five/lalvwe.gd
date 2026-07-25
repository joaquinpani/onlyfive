extends StaticBody3D


var usable = true

func interactuar():
	usable = false
	$".".hide()
	GameManager.llave = true
	$"../../Recoger".play()
	$"../CSGBox3D11/AnimationPlayer".play("pared mov")
