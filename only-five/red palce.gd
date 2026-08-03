extends Node3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		$"../../../CharacterBody3D".position = Vector3(-29.4,2.941,15.01)
		
		$"../../../Gritito".play()
		$"../../../CanvasLayer/Control/AnimationPlayer".play("red")
	pass # Replace with function body.
