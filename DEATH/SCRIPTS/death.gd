extends Control
@onready var panel = $Panel
@onready var manche_label = $Panel/MancheLabel
@onready var score_label = $Panel/ScoreLabel
@onready var upgrades_manager = $Panel/UpgradesManager

var manche : int = 0
var score : int = 0

# TODO : LINK UPGRADES
# name + level
var upgrades : Array 

var upgrade_memo := preload("res://DEATH/SCENES/upgrade_memo.tscn")
var rota : float

func _ready() -> void:
	_update_display()
	_panel_enter()

func _update_display() -> void:
	manche_label.text = "Final manche : " + str(manche)
	score_label.text = "Final score : " + str(score)
	for upgrade in upgrades:
		var child = upgrade_memo.instantiate()
		child._update_display(upgrade.name, upgrade.level)
		upgrades_manager.add_child(child)

func _panel_enter() -> void:
	var tween = create_tween()
	tween.tween_property(panel, "position", Vector2.ZERO, 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
