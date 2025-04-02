class_name Character
extends Node2D

signal OnTakeDamage (health : int)
signal OnHeal (health: int)

# selection box to define player/AI characters
@export var is_player : bool

@export var health : int
@export var max_health : int

# combat actions array
@export var combat_actions : Array[CombatAction]

var target_scale : float = 1.0

@onready var audio : AudioStreamPlayer = $AudioStreamPlayer
var take_damge_sfx : AudioStream = preload("res://Assets/Audio/take_damage.wav")
var heal_sfx : AudioStream = preload("res://Assets/Audio/heal.wav")

@export var facing_left : bool = false
@export var display_texture : Texture2D

@onready var sprite : Sprite2D = $Sprite

func _ready():
	sprite.flip_h = facing_left
	sprite.texture = display_texture

func begin_turn ():
	target_scale = 1.4
	
	if is_player:
		print("Player turn has begun")
	else:
		print("AI turn has begun")
	
func end_turn ():
	target_scale = 1.0
	
func _process(delta: float) -> void:
	pass
	
func take_damage (amount: int):
	health -= amount
	OnTakeDamage.emit(health)
	_play_audio(take_damge_sfx)
	
func heal (amount: int):
	health += amount
	health = clamp(health, 0, max_health)
	OnHeal.emit(health)
	_play_audio(heal_sfx)
	
func cast_combat_action (action : CombatAction, opponent: Character):
	if action == null:
		return
		
	if action.melee_damage > 0:
		opponent.take_damage(action.melee_damage)
	
	if action.heal_amount > 0:
		heal(action.heal_amount)
	
func _play_audio (stream: AudioStream):
	pass
	
