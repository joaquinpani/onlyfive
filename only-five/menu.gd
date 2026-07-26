extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("new_animation")
	$TextureButton/Label2/AnimationPlayer.play("new_animation")
	pass # Replace with function body.
func logo():
	$"DiseñoSinTítulo(13)/Kid1".play()
func music():
	$AlexzavesaRevealLogoBumper524252.play()
	
func cambio():
	get_tree().change_scene_to_file("res://escenario 1.tscn")


func _on_texture_button_pressed() -> void:
	$OnlyFive/Kid2.play()
	$TextureButton.hide()
	$OnlyFive/ColorRect3/AnimationPlayer.play("new_animation")
	pass # Replace with function body.
