extends Node2D

onready var window = get_node("/root/Main/Vars").window

func rots(var type, var node, var x, var y):
	if type == "rect":
		get_node(node).rect_position.x = x
		get_node(node).rect_position.y = y
func rot(var type, var node, var x, var y):
	if type == "rect":
		get_node(node).rect_position.x = (window[0]+x)/2 - get_node(node).rect_size.x/2
		get_node(node).rect_position.y = (window[1]+y)/2 - get_node(node).rect_size.y/2
	if type == "sprite":
		get_node(node).position.x = (window[0]+x)/2
		get_node(node).position.y = (window[1]+y)/2

func _ready():
	get_node("/root/Main/UI/Menu/Play").connect("pressed", self, "Play")
	get_node("/root/Main/UI/Menu/More").connect("pressed", self, "More")
	get_node("/root/Main/UI/Menu/Import").connect("pressed", self, "Import")
	get_node("/root/Main/UI/Menu/Close").connect("pressed", self, "Close")
	get_node("/root/Main/UI/Menu/Settings").connect("pressed", self, "Settings")

func Settings():
	get_node("/root/Main/Window/Settings").popup_centered()
func More():
	visible = false
	get_node("/root/Main/More").visible = true

func Import():
	get_node("Window_Import").popup_centered()

func Close():
	get_node("Close Game").popup_centered()


func _process(delta):
	window = get_node("/root/Main/Vars").window
	if get_node("/root/Main/Menu").visible == true:
		get_node("bg").position.y = window[1]/6
		get_node("Label").rect_position.y = window[1] - 65
		rot("rect", "/root/Main/UI/Menu/Play", 0, 50)
		rot("rect", "/root/Main/UI/Menu/More", 300, 50)
		#rot("rect", "/root/Main/Menu/Import", 0, 225)
		rot("rect", "/root/Main/UI/Menu/Import", -300, 50)
		rot("sprite", "/root/Main/Menu/logo", 0, window[1]/-1.75)
		rot("rect", "/root/Main/UI/Menu/Settings", 0, window[1] - 100)

	
func Play():
	get_node("/root/Main/Menu").visible = false
	get_node("/root/Main/Game").visible = true
	get_node("/root/Main/Game").edit = false
	get_node("/root/Main/Game").code = get_node("/root/Main/Vars/LVL_Company").Stereo_Madness
	get_node("/root/Main/Game").part = 1
