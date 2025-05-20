extends Camera2D
@onready var scroll_bar = $CanvasLayer/ScrollBar

const SCROLL_STRENGTH = 80.0

var target_position : Vector2
var lerp_speed := 20.0
var scrolling := false

func  _ready() -> void:
	target_position = global_position

func _physics_process(delta):
	if Input.is_action_just_released("scroll_down") and !scrolling:
		if target_position.y < 2400:
			target_position.y += SCROLL_STRENGTH
	elif Input.is_action_just_released("scroll_up") and !scrolling:
		if target_position.y > 0:
			target_position.y -= SCROLL_STRENGTH
			
	if scrolling:
		target_position.y = 2400 - scroll_bar.value
	clamp(target_position.y, 0, 2400 - 1080)
	global_position = global_position.lerp(target_position, lerp_speed * delta)
	if !scrolling:
		scroll_bar.value = 2400 - target_position.y



func _on_scroll_bar_drag_ended(_value_changed):
	scrolling = false


func _on_scroll_bar_drag_started():
	scrolling = true
