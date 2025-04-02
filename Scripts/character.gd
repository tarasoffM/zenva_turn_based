class_name Character
extends Node2D

signal OnTakeDamage (health : int)
signal OnHeal (health: int)

# selection box to define player/AI characters
@export var is_player : bool

@export var heath : int
@export var max_health : int

# combat actions array

var target_scale : float = 1.0

@onready var audio : AudioStreamPlayer = $AudioStreamPlayer
var take_damge_sfx : AudioStream = preload("res://Assets/Audio/take_damage.wav")
var heal_sfx : AudioStream = preload("res://Assets/Audio/heal.wav")

func begin_turn ():
	target_scale = 1.4
	
func end_turn ():
	target_scale = 1.0
	
func _process(delta: float) -> void:
	pass
	
func take_damage (amount: int):
	pass
	
func heal (amount: int):
	pass
	
func cast_combat_action (action, opponent: Character):
	pass
	
func _play_audio (stream: AudioStream):
	pass
	
