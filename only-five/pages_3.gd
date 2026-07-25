extends StaticBody3D
var usable = true

func interactuar():
	if $".".visible == true:
		$"../Recoger".play()
		GameManager.pages = GameManager.pages + 1
		$".".visible = false
		
	
