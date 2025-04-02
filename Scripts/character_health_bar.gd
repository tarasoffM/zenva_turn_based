extends ProgressBar

@onready var health_text : Label = $HealthText

func _ready():
	var char = get_parent()
	max_value = char.max_health
	_update_value(char.health)
	
	char.OnTakeDamage.connect(_update_value)
	char.OnHeal.connect(_update_value)
	
func _update_value (health : int):
	value = health
	health_text.text = str(health) + " / " + str(int(max_value))
	
