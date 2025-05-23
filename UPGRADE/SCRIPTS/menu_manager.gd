extends Node
@onready var menu_container = $MenuContainer

@export var available_menus : Array[MenuData]

func _ready() -> void:
	_initialize_menus()

func _initialize_menus() -> void:
	var menus = available_menus.duplicate(true)
	
	var menu_index := 0
	for child in menu_container.get_children():
		
		# Si il n'y a plus assez de menus possible
		# Attention, il faut gérer le cas ou il n'y a aucun menu possible 
		if menus.size() == 0:
			child.call_deferred("queue_free")
		
		menu_index = randi_range(0, menus.size() - 1)
		var current_menu = menus.pop_at(menu_index)
		child.current_menu = current_menu
		child._update_display()
