extends Area3D


# Called when the node enters the scene tree for the first time.
func desicion():
	$FreesoundCommunityMechanicalclamp6217.play()
	
func pequeñosmovidos():
	$FreesoundCommunityServo96129.play()
	
func aparicion():
	$FreesoundCommunityServomotor104111.play()
	
func indsi():
	$FloraphonicShortPunchySineWaveDing17E211758.play()
	
func indno():
	$FloraphonicShortPunchySineWaveDing7F211750.play()
	
func alt():
	var sel = randi_range(1, 11)
	match sel:
		1: $"son idos aleatorios/Servo12".play()
		2: $"son idos aleatorios/Servo11".play()
		3: $"son idos aleatorios/Servo10".play()
		4: $"son idos aleatorios/Servo9".play()
		5: $"son idos aleatorios/Servo1".play()
		6: $"son idos aleatorios/Servo3".play()
		7: $"son idos aleatorios/Servo4".play()
		8: $"son idos aleatorios/Servo7".play()
		9: $"son idos aleatorios/Servo5".play()
		10: $"son idos aleatorios/Servo6".play()
		11: $"son idos aleatorios/Servo8".play()
