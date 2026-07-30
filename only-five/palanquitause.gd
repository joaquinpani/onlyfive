extends StaticBody3D

var usable = true

func interactuar():
	usable = false
	$palanca/AnimationPlayer.play("Cube_001Action")
	$"../../CanvasLayer/credits/AnimationPlayer".play("new_animation")
	$"../personajes/Kid2".play()
	$"../../PalancaBaja".play()
	$"../../CanvasLayer/reloj/Timer".stop()
	$"../../CanvasLayer/reloj/Timer2".stop()
	$"../../CanvasLayer/reloj".hide()
	
	
	
func musica():
	$"../personajes/BombinsoundWorkoutWorkoutMusicVersion5551834".play()
	
func musicastop():
	$"../personajes/BombinsoundWorkoutWorkoutMusicVersion5551834".stop()
	
