extends Sprite2D

var max_hp = 50
var strength = 9
var defense = 6
var current_hp = max_hp

func recieve_attack(attack):
	current_hp -= attack - defense
