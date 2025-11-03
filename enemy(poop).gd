extends Sprite2D

var max_hp = 100
var strength = 30
var defense = 6
var current_hp = 100

@onready var HPLabel = $EnemyHP
func _ready() -> void:
	HPLabel.text = "POOP " + str(current_hp) + "/100"
	
func recieve_attack(attack):
	current_hp -= attack - defense
	HPLabel.text = "POOP " + str(current_hp) + "/100"
	
