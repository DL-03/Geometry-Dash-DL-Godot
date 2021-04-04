extends Node2D

var window

func _ready():
	
	get_node("/root/Main/UI/More/New").connect("pressed", self, "New")
	get_node("/root/Main/UI/More/Open").connect("pressed", self, "Open")
	get_node("/root/Main/UI/More/Close").connect("pressed", self, "Close")

func Open():
	get_node("Window_Import_Editor").popup_centered()

func _process(delta):
	window = get_node("/root/Main/Vars").window
	rot("rect", "/root/Main/UI/More/New", window[0]/2 - get_node("/root/Main/UI/More/New").rect_size.x/2, window[1]/2 - get_node("/root/Main/UI/More/New").rect_size.y/2 - 40)
	rot("rect", "/root/Main/UI/More/Open", window[0]/2 - get_node("/root/Main/UI/More/Open").rect_size.x/2, window[1]/2 - get_node("/root/Main/UI/More/Open").rect_size.y/2 + 40)

func rot(var type, var node, var x, var y):
	if type == "rect":
		get_node(node).rect_position.x = x
		get_node(node).rect_position.y = y
	if type == "sprite":
		get_node(node).position.x = (window[0]+x)/2
		get_node(node).position.y = (window[1]+y)/2


		
func Close():
	get_node("/root/Main/Menu").visible = true
	visible = false


func New():
	visible = false
	get_node("/root/Main/Editor").visible = true
	get_node("/root/Main/Editor").code = {"Name": "", "Mode": "cube", "Code": []}
	get_node("/root/Main/Editor").lvl = null
	get_node("/root/Main/Editor").part = 1
