extends TextureRect
@onready var animation_player = $AnimationPlayer
@onready var shine_timer = $ShineTimer


func _on_shine_timer_timeout():
	animation_player.play("shine_effect")

func _on_shine_effect_finished():
	shine_timer.start(randf_range(6.0, 12.0))
