extends Control
@onready var name_label = $TextureRect/VBoxContainer/NameLabel
@onready var level_label = $TextureRect/VBoxContainer/LevelLabel

func _upgrade_display(up_name : String, level : String) -> void:
	name_label.text = up_name
	level_label.text = level
