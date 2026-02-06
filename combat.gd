extends Node2D

@onready var enemy = $"CanvasLayer/Control/enemy(poop)"
@onready var player = $CanvasLayer/Control/Player
@onready var defeat = $FightOver/Control/DefeatText
@onready var victory = $FightOver/Control/VictoryText
@onready var attack_button = $CanvasLayer/Control/AttackButton
@onready var spell_button = $CanvasLayer/Control/SpellButton
@onready var block_button = $CanvasLayer/Control/BlockButton
@onready var cock_bending = $CanvasLayer/Control/CockBending
@onready var healing_brap = $CanvasLayer/Control/HealingBrap
@onready var smely_monkley_balls = $CanvasLayer/Control/SmelyMonkleyBalls
@onready var fireball = $CanvasLayer/Control/Fireball

var player_turn = true

func _on_attack_pressed() -> void:
	enemy.recieve_attack(player.strength)
	if enemy.current_hp <= 0 :
		victory.visible = true
		attack_button.visible = false
		block_button.visible = false
		spell_button.visible = false
	else :
		player_turn = false
		
		
func _on_block_button_pressed() -> void:
	player.recieve_attack(4 * enemy.strength / 5)
	
func _on_spell_button_pressed() -> void:
	attack_button.visible = false
	block_button.visible = false
	spell_button.visible = false
	smely_monkley_balls.visible = true
	healing_brap.visible = true
	cock_bending.visible = true
	fireball.visible = true


func _on_fireball_pressed() -> void:
	attack_button.visible = true
	block_button.visible = true
	spell_button.visible = true
	smely_monkley_balls.visible = false
	healing_brap.visible = false
	cock_bending.visible = false
	fireball.visible = false
	if player.current_mana >= 5 :
		enemy.recieve_flame(14)
		player.spell_cast(5)
	if enemy.current_hp <= 0 :
		victory.visible = true
		attack_button.visible = false
		block_button.visible = false
		spell_button.visible = false
	else :
		player_turn = false
		


func _on_cock_bending_pressed() -> void:
	attack_button.visible = true
	block_button.visible = true
	spell_button.visible = true
	smely_monkley_balls.visible = false
	healing_brap.visible = false
	cock_bending.visible = false
	fireball.visible = false
	if player.current_mana >= 25 :
		enemy.recieve_attack(40)
		player.spell_cast(25)
	if enemy.current_hp <= 0 :
		victory.visible = true
		attack_button.visible = false
		block_button.visible = false
		spell_button.visible = false
	else :
		player_turn = false
		


func _on_healing_brap_pressed() -> void:
	if player.current_mana >= 8:
		player.current_hp += 20
		if player.current_hp > player.max_hp :
			player.current_hp = player.max_hp
		player.HPLabel.text = str(player.current_hp) + "|" + str(player.max_hp)
		player.spell_cast(8)
		player_turn = false
	attack_button.visible = true
	block_button.visible = true
	spell_button.visible = true
	smely_monkley_balls.visible = false
	healing_brap.visible = false
	cock_bending.visible = false
	fireball.visible = false


func _on_smely_monkley_balls_pressed() -> void:
	attack_button.visible = true
	block_button.visible = true
	spell_button.visible = true
	smely_monkley_balls.visible = false
	healing_brap.visible = false
	cock_bending.visible = false
	fireball.visible = false
	if player.current_mana >= 8 :
		enemy.recieve_stink(25)
		player.spell_cast(8)
	if enemy.current_hp <= 0 :
		victory.visible = true
		attack_button.visible = false
		block_button.visible = false
		spell_button.visible = false
	else :
		player_turn = false
		
func _process(_delta: float) -> void: 
	if player_turn == false :
		player.recieve_attack(enemy.strength)
		player_turn = true
	if player.current_hp <= 0 :
		defeat.visible = true
		attack_button.visible = false
		block_button.visible = false
		spell_button.visible = false
#Keep at bottom so that the player's turn happens again after their action.
