extends Panel

@onready var button_container = $ButtonContainer
var ca_buttons : Array[CombatActionButton]

@onready var description_text : RichTextLabel = $Description
@onready var game_manager = $"../.."
