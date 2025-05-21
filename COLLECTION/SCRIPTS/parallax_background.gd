extends ParallaxBackground

const HORIZONTAL_SCROLLING := -60

func _physics_process(delta) -> void:
	scroll_offset += Vector2(HORIZONTAL_SCROLLING * delta, 0)
