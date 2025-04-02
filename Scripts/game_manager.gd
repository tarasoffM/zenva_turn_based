extends Node2D

@export var player_character : Character
@export var ai_character : Character
var current_character : Character

var game_over : bool = false

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
		pass
		#enable and set player ui
		await get_tree().create_timer(0.5).timeout
		next_turn()
	else:
		#disable player ui
		var wait_time = randf_range(1, 2)
		await get_tree().create_timer(wait_time).timeout
		# cast combat action
		await get_tree().create_timer(0.5).timeout
		next_turn()

func player_cast_combat_action (action):
	if player_character != current_character:
		return
		
	player_character.cast_combat_action(action, ai_character)
	# disable player ui
	await get_tree().create_timer(0.5).timeout
	
func ai_decide_combat_action ():
	pass
