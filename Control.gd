extends Node2D

func _ready():
	get_node("up").connect("pressed", self, "up")
	get_node("down").connect("pressed", self, "down")
	get_node("left").connect("pressed", self, "left")
	get_node("right").connect("pressed", self, "right")
func up():
	get_node("/root/Main/Camera2D").position.y -= 50
func down():
	get_node("/root/Main/Camera2D").position.y += 50
func left():
	get_node("/root/Main/Camera2D").position.x -= 50
func right():
	get_node("/root/Main/Camera2D").position.x += 50
