extends Panel

@onready var header_text : Label = $HeaderText

func set_header_text (text_to_display : String):
	header_text.text = text_to_display
	


func _on_play_again_pressed() -> void:
	get_tree().reload_current_scene()
