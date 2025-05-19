extends ParallaxBackground

const HORIZONTAL_SCROLLING := -30
const VERTICAL_SCROLLING := -20

func _physics_process(delta) -> void:
	scroll_offset += Vector2(HORIZONTAL_SCROLLING * delta, VERTICAL_SCROLLING * delta)
