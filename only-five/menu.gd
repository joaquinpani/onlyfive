extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("new_animation")
	
	pass # Replace with function body.
func logo():
	$"DiseñoSinTítulo(13)/Kid1".play()
	

	
	
func music():
	var numero = randi_range(1, 3)
	numero = 1
	$"menu real/AnimationPlayer".play("entrada")
	$ChakongFilmVideoGameMusicTensionAdventureCrimeWarMission251520.play()
	match numero:
		1: escena1()
		2: escena2()
		3: escena3()
	
func cambio():
	get_tree().change_scene_to_file("res://escenario 1.tscn")


func _on_texture_button_pressed() -> void:
	$"menu real/AnimationPlayer".speed_scale = 3
	$"menu real/AnimationPlayer".play_backwards("entrada")
	$Camera3D/AnimationPlayer.play("entrar")
	$Camera3D/Timer2.start()




func escena1():
	$Camera3D/AnimationPlayer.play("new_animation",1.0,0.5)
	$Camera3D/Timer.start()
	pass
	
func escena2():
	pass
func escena3():
	pass


func _on_timer_timeout() -> void:
	$Camera3D/AnimationPlayer.play("idle",4.0)
	pass # Replace with function body.


func _on_texture_button_mouse_entered() -> void:
	$"menu real/botones/Label/AnimationPlayer".play("label2",0.5,2.0)
	pass # Replace with function body.


func _on_texture_button_mouse_exited() -> void:
	$"menu real/botones/Label/AnimationPlayer".play("label",0.5,2.0)
	pass # Replace with function body.


func _on_texture_button_2_mouse_entered() -> void:
	$"menu real/botones/Control/Label2/AnimationPlayer".play("label2",0.5,2.0)
	pass # Replace with function body.


func _on_texture_button_2_mouse_exited() -> void:
	$"menu real/botones/Control/Label2/AnimationPlayer".play("label",0.5,2.0)
	pass # Replace with function body.


func _on_texture_button_4_mouse_entered() -> void:
	$"menu real/botones/Control3/Label4/AnimationPlayer".play("label2",0.5,2.0)
	pass # Replace with function body.


func _on_texture_button_4_mouse_exited() -> void:
	$"menu real/botones/Control3/Label4/AnimationPlayer".play("label",0.5,2.0)
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	cambio()
	pass # Replace with function body.
