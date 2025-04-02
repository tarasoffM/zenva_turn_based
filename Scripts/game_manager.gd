extends Node2D

@export var player_character : Character
@export var ai_character : Character
var current_character : Character

@onready var player_ui = $CanvasLayer/CombatActionsUI

var game_over : bool = false

func _ready():
	next_turn()

func next_turn ():
	if game_over:
		return
			
	if current_character != null:
		current_character.end_turn()
		
	if current_character == ai_character or current_character == null:
		current_character = player_character
	else:
		current_character = ai_character
		
	current_character.begin_turn()
	
	if current_character.is_player:
		player_ui.visible = true
		player_ui.set_combat_actions(player_character.combat_actions)

	else:
		player_ui.visible = false
		var wait_time = randf_range(1, 2)
		await get_tree().create_timer(wait_time).timeout
		
		var action_to_cast = ai_decide_combat_action()
		ai_character.cast_combat_action(action_to_cast, player_character)
		
		await get_tree().create_timer(0.5).timeout
		next_turn()

func player_cast_combat_action (action : CombatAction):
	if player_character != current_character:
		return
		
	player_character.cast_combat_action(action, ai_character)
	player_ui.visible = false
	await get_tree().create_timer(0.5).timeout
	next_turn()
	
func ai_decide_combat_action () -> CombatAction:
	return null
