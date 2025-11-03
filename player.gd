extends Sprite2D

var max_hp = 100
var strength = 35
var defense = 5
var current_hp = 100

@onready var HPLabel = $PlayerHP
func _ready() -> void:
	HPLabel.text = "Graggle
	" + str(current_hp) + "/100"
	
func recieve_attack(attack):
	current_hp -= attack - defense
	HPLabel.text = "Graggle
	" + str(current_hp) + "/100"
	
