extends Node
@onready var animation = $Animation
@onready var name_label = $NameLabel
@onready var desc_label = $DescLabel
@onready var password = $Password
@onready var password_text = $Password/Password_text
@onready var select_button = $Select_button
@onready var particle_big = $ParticleBig
@onready var particle_small = $ParticleSmall


@export var characters : Array[CharacterData]
var current_character : CharacterData
var current_index : int

func _ready() -> void:
	_initialize()
	_update_display()

func _process(_delta) -> void:
	if Input.is_action_just_pressed("left"):
		_prev()
	if Input.is_action_just_pressed("right"):
		_next()

func _initialize() -> void:
	var i := 0
	for child in characters:
		if child.is_selected == true:
			current_character = child
			current_index = i
		i += 1

func _update_display() -> void:
	if current_character.is_unlocked: # UNLOCKED
		#ANIMATION
		animation.play(str(current_index))
		animation.self_modulate.r = 1.0
		animation.self_modulate.g = 1.0
		animation.self_modulate.b = 1.0
		animation.self_modulate.a = 1.0
		#NAME
		name_label.text = current_character.name
		#DESCRIPTION
		desc_label.text = current_character.description
		#PASSWORD
		password.hide()
		#SELECT
		select_button.show()
		
	else: #LOCKED
		#ANIMATION
		animation.play(str(current_index))
		animation.self_modulate.r = 0
		animation.self_modulate.g = 0
		animation.self_modulate.b = 0
		animation.self_modulate.a = 0.5
		#NAME
		name_label.text = current_character.name
		#DESCRIPTION
		desc_label.text = "???"
		#PASSWORD
		password.show()
		#SELECT
		select_button.hide()
	

func _unlock_character() -> void:
	characters[current_index].is_unlocked = true
	_update_display()
	particle_big.emitting = true
	particle_small.emitting = true

func _on_prev_button_pressed() -> void:
	_prev()

func _on_next_button_pressed() -> void:
	_next()

func _prev() -> void:
	current_index -= 1
	if current_index < 0:
		current_index = characters.size() -1
	current_character = characters[current_index]
	_update_display()

func _next() -> void:
	current_index += 1
	if current_index >= characters.size():
		current_index = 0
	current_character = characters[current_index]
	_update_display()
	
func _on_password_text_submitted(new_text) -> void:
	if current_character.password == new_text:
		_unlock_character()
	password_text.text = ""

func _on_select_button_pressed():
	for child in characters:
		child.is_selected = false
	characters[current_index].is_selected = true
	var tween = create_tween()
	tween.tween_property(animation, "scale", Vector2(1.2, 1.2), 0.2).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BOUNCE)
	await get_tree().create_timer(0.2).timeout
	var tween2 = create_tween()
	tween2.tween_property(animation, "scale", Vector2(1, 1), 0.1).set_trans(Tween.TRANS_CIRC)
