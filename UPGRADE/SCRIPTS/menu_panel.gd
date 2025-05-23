extends RigidBody2D
@onready var spin_timer = $SpinTimer
@onready var desc_label = $DescLabel
@onready var title_label = $TitleLabel
@onready var effect_label_1 = $EffectContainer/EffectLabel1
@onready var effect_label_2 = $EffectContainer/EffectLabel2

var current_menu : MenuData = null

func _update_display() -> void:
	title_label.text = current_menu.name
	desc_label.text = current_menu.description
	effect_label_1.text = "niveau " + str(current_menu.level) + "/" + str(current_menu.max_level)
	effect_label_2.text = current_menu.effects[current_menu.level]

func _on_button_mouse_entered():
	print("mouse enter")
	var strength = randi_range(100, 150)
	var random = [-1, 1].pick_random()
	apply_impulse(Vector2(strength * random, strength * random), Vector2(0, 0))

func _on_left_button_mouse_entered():
	if spin_timer.time_left == 0:
		var strength = randi_range(100, 150)
		apply_impulse(Vector2(strength, 0), Vector2.ZERO)
		spin_timer.start(0.6)

func _on_right_button_mouse_entered():
	if spin_timer.time_left == 0:
		var strength = randi_range(-100, -150)
		apply_impulse(Vector2(strength, 0), Vector2.ZERO)
		spin_timer.start(0.6)
