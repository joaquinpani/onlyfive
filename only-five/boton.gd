extends Area3D
@onready var malla = $boton1
var posini: Vector3
var ocupado: bool = false
signal presionado
func _ready() -> void:
	posini = malla.position
	
func presionar():
	if ocupado:
		return
	ocupado = true
	emit_signal("presionado")
	$"../SoundrealityButton4214382".play()
	var tween = create_tween()
	tween.tween_property(malla, "position:y", posini.y - 0.09, 0.1)
	tween.tween_property(malla, "position:y", posini.y, 0.1).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_callback(func(): ocupado = false)
	
