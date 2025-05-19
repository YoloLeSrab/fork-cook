extends RigidBody2D

@onready var sprite = $Sprite2D

var grabed := false
var possible_grab := false
var mouse_offset : Vector2

func _process(_delta):
	if Input.is_action_just_pressed("left_clic") and possible_grab:
		grabed = true
		mouse_offset = get_global_mouse_position() - global_position
		gravity_scale = 0
	elif Input.is_action_just_released("left_clic") and grabed:
		grabed = false
	
	if grabed:
		global_position = get_global_mouse_position() - mouse_offset

func _on_visible_on_screen_notifier_2d_screen_exited():
	call_deferred("queue_free")

func _on_area_2d_mouse_entered():
	possible_grab = true

func _on_area_2d_mouse_exited():
	possible_grab = false
	if grabed:
		grabed = false
