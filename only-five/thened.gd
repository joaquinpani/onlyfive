extends Node3D
var trig1 = true
var trig2 = true
var trig3 = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.onlyfiveaparece == true:
		GameManager.onlyfiveaparece = false
		$personajes/AnimationPlayer.play("bajan")
	if GameManager.palancaaparecer == true:
		GameManager.palancaaparecer = false
		$palanquita4/AnimationPlayer.play("aparecer")
		

func _on_area_3d_body_entered(body: Node3D) -> void:
	
	if body.is_in_group("player") and trig1 == true:
		trig1 = false
		$palanquita4/AnimationPlayer.play("derecha")
	pass # Replace with function body.


func _on_area_3d_3_body_entered(body: Node3D) -> void:
	
	if body.is_in_group("player") and trig2 == true:
		trig2 = false
		$palanquita4/AnimationPlayer.play("izquierda")
		$personajes/ling.position = Vector3(-7.61,2.745,3.841)
		$personajes/mons.position = Vector3(-5.36,2.745,3.021)
		$"personajes/filemon+".position = Vector3(-3.90,2.745,3.845)
		$personajes/alien.position = Vector3(-3.5,2.745,3.604)
		$"hablar personaje5".position = Vector3(-26.3,0,-27.8)
		


func _on_area_3d_2_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and trig3 == true:
		DialogueManager.show_example_dialogue_balloon(load("res://realfinal.dialogue"), "start")
		trig3 = false
		$palanquita4/AnimationPlayer.play("centro")
		$personajes/ling.position = Vector3(-7.49,2.745,-2.6)
		$personajes/mons.position = Vector3(-5.49,2.745,-2.17)
		$"personajes/filemon+".position = Vector3(-4.99,2.745,-0.63)
		$personajes/alien.position = Vector3(-3.088,2.745,1.259)
		$"hablar personaje5".position = Vector3(-31,2.745,-30.5)
	pass # Replace with function body.
