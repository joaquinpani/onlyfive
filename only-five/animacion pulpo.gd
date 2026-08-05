extends Node3D


func principal():
	$Sphere/AnimationPlayer.play("normal")
	
func flotadores():
	$Icosphere_004/AnimationPlayer.play("new_animation")
	$Icosphere/AnimationPlayer.play("new_animation")
