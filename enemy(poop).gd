extends Sprite2D

var max_hp = 50
var strength = 9
var defense = 6
var current_hp = max_hp
var flame_resist = 5
var stink_resist = 10

func recieve_attack(attack):
	current_hp -= attack - defense
	
func recieve_stink(smell):
	current_hp -= smell - stink_resist
	
func recieve_flame(fire):
	current_hp -= fire - flame_resist
