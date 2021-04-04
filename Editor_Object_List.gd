extends Node2D


var objectT = [
"Nblock1", 
"Mblock1", 
"Mblock2", 
"Mblock3", 
"Mblock4", 
"Mblock5", 
"Mblock6", 
"Mblock7", 
"Mblock8", 
"NHalfblock1", 
"Nspike1",
"Lspike1",
"NHalfspike1",
"Pcube",
"Pship"]
var window
func _ready():
	var xs = 0
	for x in range(0, len(objectT)):
		if x % 8 == 0 and x != 0:
			xs += 1
		var b = load("res://Edit_Object_Button.tscn")
		var enemy = b.instance()
		enemy.position.x = x*55 - xs*(55*8) - (55*8)/2
		enemy.position.y = xs % 2 * 60
		enemy.img = objectT[x]
		add_child(enemy)

func _process(delta):
	window = get_node("/root/Main/Vars").window
	position.x = get_node("/root/Main/Camera2D").position.x
	position.y = get_node("/root/Main/Camera2D").position.y + window[1]/3
	scale.x = get_node("/root/Main/Camera2D").zoom.x
	scale.y = get_node("/root/Main/Camera2D").zoom.y



func _on_Delete_pressed():
	get_node("/root/Main/Editor").buildO = "Delete"


func _on_rotm_pressed():
	get_node("/root/Main/Editor").Rot -= 90


func _on_rotp_pressed():
	get_node("/root/Main/Editor").Rot += 90
