extends Label




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label4.text = str(GameManager.pages)
	pass


func _on_texture_button_pressed() -> void:
	pass # Replace with function body.
