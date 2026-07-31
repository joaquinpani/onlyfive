extends StaticBody3D
var usable1 = true
var usable = true

func interactuar():
	usable = false
	$palanca/AnimationPlayer.play("Cube_001Action")
	$"../Node/CSGBox3D11/AnimationPlayer".play("pared mov")
	
	$"../PalancaBaja".play()
	$"../Node/Label3D".hide()
	$"../ParedMoviendose".play()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if usable1 == true:
		$"../Node/AnimationPlayer".play("goup")
		$"../Node/CSGBox3D11/AnimationPlayer".play_backwards("pared mov")
		$"../ParedMoviendose".play()
		usable1 = false
		$"../CanvasLayer/Label/AnimationPlayer".play("parkul")
		$"../BombinsoundWorkoutWorkoutMusicVersion5551834".play()
	pass # Replace with function body.
