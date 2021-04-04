extends Node2D

var img


func _ready():
	get_node("ico").texture = load("res://Resources/Objects/" + img + ".png")
	get_node("Button").connect("pressed", self, "Button")
	
func Button():
	if get_node("/root/Main/Editor").buildO == img:
		get_node("/root/Main/Editor").buildO = null
	else:
		get_node("/root/Main/Editor").buildO = img
