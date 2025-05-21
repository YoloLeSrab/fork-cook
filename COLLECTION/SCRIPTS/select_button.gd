extends Button
@onready var select_label = $SelectLabel


func _on_mouse_entered():
	select_label.position.y += 12

func _on_mouse_exited():
	select_label.position.y -= 12
