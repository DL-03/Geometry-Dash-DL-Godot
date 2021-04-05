extends Node2D

var Rot = 0
var lvl
var part = 0
onready var cam = get_node("/root/Main/Camera2D")
onready var mouse = get_node("/root/Main/Vars").mouse

var buildO
var code
var xpp = 0
var DeleteO
onready var objectT = get_node("/root/Main/Vars").objectT

func _ready():
	get_node("/root/Main/UI/Editor/Close").connect("pressed", self, "Close")
	get_node("/root/Main/UI/Editor/Save_As").connect("pressed", self, "Save_As")
	get_node("/root/Main/UI/Editor/SaveB").connect("pressed", self, "SaveB")
	get_node("/root/Main/UI/Editor/Rot/rotm").connect("pressed", self, "rotm")
	get_node("/root/Main/UI/Editor/Rot/rotp").connect("pressed", self, "rotp")
	get_node("/root/Main/UI/Editor/Delete").connect("pressed", self, "Delete")
	get_node("/root/Main/UI/Editor/Play").connect("pressed", self, "Play")

func Play():
	visible = false
	get_node("/root/Main/Game").code = code
	get_node("/root/Main/Game").lvl = null
	get_node("/root/Main/Game").edit = true
	get_node("/root/Main/Game").part = 1
	get_node("/root/Main/Game").visible = true
func Delete():
	buildO = "Delete"
func rotm():
	Rot -= 90
func rotp():
	Rot += 90



func ret():
	var path = lvl
	if lvl != null:
		var file = File.new()
		file.open(path, File.READ)
		code = parse_json(file.get_line())
	var xp = []
	for c in range(0, len(code['Code'])):
		var xs = code['Code'][c].get('x')
		var xs2 = code['Code'][c].get('xo')
		var ys = code['Code'][c].get('y')
		var ys2 = code['Code'][c].get('yo')
		var xs3 = 0
		var ys3 = 0
		if xs != null:
			xs3 += xs
		if xs2 != null:
			xs3 += xs2*code['Code'][c]['size']
		if ys != null:
			ys3 += ys
		if ys2 != null:
			ys3 += ys2*code['Code'][c]['size']
		xp.append(xs3)
		var Temp = [code['Code'][c]['Object'], xs3, ys3 * -1, code['Code'][c]['size'], code['Code'][c]['rots']]
		var b = load("res://Object.tscn")
		var enemy = b.instance()
		enemy.position.x = Temp[1]
		enemy.position.y = Temp[2]
		enemy.rotation = Temp[4] / (90 / 1.5708)
		enemy.type = objectT[Temp[0]]
		enemy.img = Temp[0]
		add_child(enemy)
	if xp != []:
		xpp = xp.max() + 1000
	else:
		xpp = 1000
	var scene = load("res://Floor.tscn")
	for i in range(0, int(xpp/(512/45))):
		var enemy = scene.instance()
		enemy.position.x = 1024 * i + 495
		enemy.position.y = 939.5 - 405
		
		add_child(enemy)
	

	
	part = 0
	Rot = 0
var window
func rot(var type, var node, var x, var y):
	if type == "rect":
		get_node(node).rect_position.x = x
		get_node(node).rect_position.y = y
	if type == "sprite":
		get_node(node).position.x = x
		get_node(node).position.y = y
var os
func _process(delta):
	if Rot > 360:
		Rot = 90
	if Rot < 0:
		Rot = 270
	get_node("/root/Main/UI/Editor/Rot/rot").text = "Rot: " + str(Rot)
	mouse = get_node("/root/Main/Vars").mouse
	window = get_node("/root/Main/Vars").window
	os = OS.get_name()
	rot("rect", "/root/Main/UI/Editor/Play", get_node("/root/Main/Camera2D").position.x - window[0] * get_node("/root/Main/Camera2D").zoom.x/2 + 80, get_node("/root/Main/Camera2D").position.y - window[1]*get_node("/root/Main/Camera2D").zoom.y/2)
	get_node("/root/Main/UI/Editor/Play").rect_scale.x = get_node("/root/Main/Camera2D").zoom.x
	get_node("/root/Main/UI/Editor/Play").rect_scale.y = get_node("/root/Main/Camera2D").zoom.y
	rot("rect", "/root/Main/UI/Editor/Close", get_node("/root/Main/Camera2D").position.x - window[0] * get_node("/root/Main/Camera2D").zoom.x/2, get_node("/root/Main/Camera2D").position.y - window[1]*get_node("/root/Main/Camera2D").zoom.y/2)
	get_node("/root/Main/UI/Editor/Close").rect_scale.x = get_node("/root/Main/Camera2D").zoom.x
	get_node("/root/Main/UI/Editor/Close").rect_scale.y = get_node("/root/Main/Camera2D").zoom.y
	rot("rect", "/root/Main/UI/Editor/Save_As", get_node("/root/Main/Camera2D").position.x + window[0] * get_node("/root/Main/Camera2D").zoom.x/2 - 165, get_node("/root/Main/Camera2D").position.y - window[1]*get_node("/root/Main/Camera2D").zoom.y/2+15)
	get_node("/root/Main/UI/Editor/Save_As").rect_scale.x = get_node("/root/Main/Camera2D").zoom.x
	get_node("/root/Main/UI/Editor/Save_As").rect_scale.y = get_node("/root/Main/Camera2D").zoom.y
	rot("rect", "/root/Main/UI/Editor/SaveB", get_node("/root/Main/Camera2D").position.x + window[0] * get_node("/root/Main/Camera2D").zoom.x/2 - 330, get_node("/root/Main/Camera2D").position.y - window[1]*get_node("/root/Main/Camera2D").zoom.y/2+15)
	get_node("/root/Main/UI/Editor/SaveB").rect_scale.x = get_node("/root/Main/Camera2D").zoom.x
	get_node("/root/Main/UI/Editor/SaveB").rect_scale.y = get_node("/root/Main/Camera2D").zoom.y
	if os == "Windows" or os == "OSX":
		get_node("/root/Main/UI/Editor/Control").visible = false
	elif os == "Android":
		get_node("/root/Main/UI/Editor/Control").visible = true
	rot("sprite", "/root/Main/UI/Editor/Control", get_node("/root/Main/Camera2D").position.x - window[0] * get_node("/root/Main/Camera2D").zoom.x/2 + 150, get_node("/root/Main/Camera2D").position.y + window[1]*get_node("/root/Main/Camera2D").zoom.y/2 - 150)
	get_node("/root/Main/UI/Editor/Control").scale.x = get_node("/root/Main/Camera2D").zoom.x
	get_node("/root/Main/UI/Editor/Control").scale.y = get_node("/root/Main/Camera2D").zoom.y
	if os == "Windows" or os == "OSX":
		rot("sprite", "/root/Main/UI/Editor/Rot", get_node("/root/Main/Camera2D").position.x + window[0] * get_node("/root/Main/Camera2D").zoom.x/2 - 140, get_node("/root/Main/Camera2D").position.y + window[1]*get_node("/root/Main/Camera2D").zoom.y/2 - 125)
	elif os == "Android":
		rot("sprite", "/root/Main/UI/Editor/Rot", get_node("/root/Main/Camera2D").position.x + window[0] * get_node("/root/Main/Camera2D").zoom.x/2 - 140, get_node("/root/Main/Camera2D").position.y + window[1]*get_node("/root/Main/Camera2D").zoom.y/2 - 100)
	get_node("/root/Main/UI/Editor/Rot").scale.x = get_node("/root/Main/Camera2D").zoom.x
	get_node("/root/Main/UI/Editor/Rot").scale.y = get_node("/root/Main/Camera2D").zoom.y
	if os == "Windows" or os == "OSX":
		rot("rect", "/root/Main/UI/Editor/Delete", get_node("/root/Main/Camera2D").position.x - window[0] * get_node("/root/Main/Camera2D").zoom.x/2 + 75, get_node("/root/Main/Camera2D").position.y + window[1]*get_node("/root/Main/Camera2D").zoom.y/2 - 175)
	elif os == "Android":
		rot("rect", "/root/Main/UI/Editor/Delete", get_node("/root/Main/Camera2D").position.x + window[0] * get_node("/root/Main/Camera2D").zoom.x/2 - 230, get_node("/root/Main/Camera2D").position.y + window[1]*get_node("/root/Main/Camera2D").zoom.y/2 - 235)
	get_node("/root/Main/UI/Editor/Delete").rect_scale.x = get_node("/root/Main/Camera2D").zoom.x
	get_node("/root/Main/UI/Editor/Delete").rect_scale.y = get_node("/root/Main/Camera2D").zoom.y
	if visible == true and part == 1:
		ret()
	if visible == false:
		code = null
	if visible == true:
		var xs = round((mouse[0]*cam.zoom.x+cam.position.x-(window[0]*cam.zoom.x/2))/45)*45
		var ys = round((mouse[1]*cam.zoom.y+cam.position.y-(window[1]*cam.zoom.y/2))/45)*45
		if Input.is_action_just_pressed("left_mouse") and buildO != null and buildO != "Delete" and window[1] - mouse[1] > 215 and mouse[1] > 75:
			var b = load("res://Object.tscn")
			var enemy = b.instance()
			enemy.position.x = xs
			enemy.position.y = ys
			enemy.rotation = Rot / (90 / 1.5708)
			enemy.type = objectT[buildO]
			enemy.img = buildO
			code["Code"].append({"Object": buildO, "x": xs, "y": ys*-1, "size": 45, "rots": Rot})
			get_node("/root/Main/Editor").add_child(enemy)
		if Input.is_action_just_pressed("left_mouse") and buildO == "Delete":
			DeleteO = [xs, ys]


func Close():
	buildO = null
	get_node("/root/Main/Window/Close").popup_centered()


func Save_As():
	buildO = null
	get_node("/root/Main/Window/Save").popup_centered()

func SaveB():
	if lvl == null:
		Save_As()
	else:
		var save_game = File.new()
		save_game.open(lvl, File.WRITE)
		save_game.store_line(to_json(code))
		save_game.close()
