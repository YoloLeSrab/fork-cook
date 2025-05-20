extends Node


# TABLEAU POUR L'EXEMPLE
## array[array[string, string]]
var scores = [["tfiette", "1234567890"],
["sconiat", "123456789"],
["leogarci", "12345678"],
["ahenault", "1234567"],
["ramahrez", "123456"],
["pfranke", "12345"],
["mlemerci", "1234"],
#["jle-doua", "123"],
#["albaud", "12"],
["sakerken", "1"]]

func _ready() -> void:
	init_panels()

func init_panels() -> void:
	var safe_number = scores.size()
	var child_number := 0
	
	for child in get_children():
		
		if not child.is_node_ready():
			await child.ready
			
		if child.is_in_group("panel") and (child_number) < safe_number:
			var login = scores[child_number][0]
			var score = scores[child_number][1]
			child._initialize(child_number + 1, login, score)
			child_number += 1
