extends RigidBody2D
@onready var sprite_2d = $Sprite2D

@export var JoinL : Joint2D = null
@export var JoinR : Joint2D = null

@onready var rank = $Sprite2D/HBoxContainer/rank
@onready var login = $Sprite2D/HBoxContainer/name
@onready var score = $Sprite2D/HBoxContainer/score

var texture_gold := preload("res://LEADERBOARD/ASSETS/ELEMENTS/LeaderboardNodeGold.png")

@export var joined := true
var pressed := 0

func _initialize(lb_rank : int, lb_login : String, lb_score : String) -> void:
	
	if lb_rank == 1:
		sprite_2d.texture = texture_gold
	global_position.x += randf_range(-40.0, 40.0)
	
	#update labels :
	rank.text = str(lb_rank)
	login.text = lb_login
	score.text = lb_score

func _on_button_pressed() -> void:
	print("pressed")
	var strenght = randi_range(100, 500)
	var up = [-1, 1].pick_random()
	var side = [-1, 1].pick_random()
	apply_impulse(Vector2(strenght * side, strenght * up), Vector2(0, 0))
	pressed += 1
	if joined and pressed > 3:
		var random = randi_range(0, 6)
		if !(random):
			_join_break()

func _join_break() -> void:
	var side = 0
	if JoinL == null:
		side = 1
	elif JoinR == null:
		side = -1
	elif JoinL != null and JoinR != null:
		side = [-1, 1].pick_random()
	match side:
		-1:
			await JoinL.call_deferred("queue_free")
			JoinL = null
		1:
			await JoinR.call_deferred("queue_free")
			JoinR = null
	if JoinL == null and JoinR == null:
		joined = false
