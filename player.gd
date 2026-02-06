extends Sprite2D

var max_hp = 100
var strength = 12
var defense = 5
var current_hp = max_hp
var max_mana = 40
var current_mana = max_mana

@onready var HPLabel = $PlayerHP
	
func recieve_attack(attack):
	current_hp -= attack - defense
	HPLabel.text = "Graggle
	" + str(current_hp) + "/" + str(max_hp)
	
