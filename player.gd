extends Sprite2D

var max_hp = 100
var strength = 12
var defense = 5
var current_hp = max_hp
var max_mana = 40
var current_mana = max_mana

@onready var HPLabel = $PlayerHP
@onready var MPLabel = $PlayerMP
	
func recieve_attack(attack):
	if attack - defense < 0 :
		pass
	else :
		current_hp -= attack - defense
	HPLabel.text = str(current_hp) + "|" + str(max_hp)
	
func spell_cast(mana):
	current_mana -= mana
	MPLabel.text = str(current_mana) + "|" + str(max_mana)
	
