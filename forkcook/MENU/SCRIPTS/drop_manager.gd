extends Node
@onready var drop_timer = $DropTimer

#region SPRITES

const SPRITES := [preload("res://MENU/ASSETS/INGREDIENTS/Boeuf.png"), 
preload("res://MENU/ASSETS/INGREDIENTS/Citron.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Eau.png"), 
preload("res://MENU/ASSETS/INGREDIENTS/Eau.png"), 
preload("res://MENU/ASSETS/INGREDIENTS/Farine.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Fraise.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Lait.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Laitue.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Oeuf.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Oignon.png"),
preload("res://MENU/ASSETS/INGREDIENTS/pate.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Poulet.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Riz.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Saumon.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Sucre.png"),
preload("res://MENU/ASSETS/INGREDIENTS/Thon.png")]
#endregion

var ingredient := preload("res://MENU/SCENES/ingredient.tscn")



func init_child() -> void:
	var i := randi_range(0, 15)
	var child = ingredient.instantiate()
	add_child(child)
	if !(child.is_node_ready()):
		await child.ready
	child.global_position = Vector2(randi_range(-10, 1930), -300)
	child.global_rotation = randi_range(-360, 360)
	var scale := randf_range(0.8, 1.0)
	child.sprite.scale = Vector2(scale, scale)
	child.sprite.texture = SPRITES[i]
	var rotation = randf_range(2.0, 4.0)
	var inverse = randi_range(0, 1)
	if inverse:
		child.angular_velocity = rotation
	else:
		child.angular_velocity = -rotation

func _on_drop_timer_timeout():
	init_child()
	drop_timer.start(randf_range(0.2, 1.4))
