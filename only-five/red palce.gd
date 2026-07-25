extends Node3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		$"../../CharacterBody3D".position = Vector3(-10.3, 2,-23.0)
		$"../../CanvasLayer/Control/AnimationPlayer".play("red")
		$"../../Gritito".play()
	pass # Replace with function body.
