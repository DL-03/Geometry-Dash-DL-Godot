extends Node2D

func Visible(var node):
	get_node(node).visible = get_node("/root/Main/" + node).visible

		

func _process(delta):
	Visible("Menu")
	Visible("Game")
	Visible("More")
	Visible("Editor")
