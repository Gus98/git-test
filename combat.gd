extends Node2D

@onready var enemy = $"CanvasLayer/Control/enemy(poop)"
@onready var player = $CanvasLayer/Control/Player
@onready var defeat = $FightOver/Control/DefeatText
@onready var victory = $FightOver/Control/VictoryText
@onready var attack_button = $CanvasLayer/Control/Button

var player_turn = true

func _on_button_pressed() -> void:
	enemy.recieve_attack(player.strength)
	if enemy.current_hp <= 0 :
		victory.visible = true
		attack_button.disabled = true
	else :
		player_turn = false
		attack_button.disabled = true
		
func _process(_delta: float) -> void:
	if player_turn == false :
		player.recieve_attack(enemy.strength)
		player_turn = true
		attack_button.disabled = false
	if player.current_hp <= 0 :
		defeat.visible = true
		attack_button.disabled = true
