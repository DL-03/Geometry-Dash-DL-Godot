extends Node2D

var edit = false
var lvl
var part = 0
onready var cam = get_node("/root/Main/Camera2D")

onready var objectT = get_node("/root/Main/Vars").objectT

func Close():
	get_node("/root/Main/Menu").visible = true
	get_node("/root/Main/Game").visible = false

func _ready():
	get_node("/root/Main/UI/Game/Close").connect("pressed", self, "Close")
	get_node("/root/Main/UI/Game/Edit").connect("pressed", self, "Edit")

func Edit():
	get_node("/root/Main/Editor").visible = true
	get_node("/root/Main/Editor").code = code
	visible = false

	

var xpp = 0
var code

func ret():
	var path = lvl
	if lvl != null:
		var file = File.new()
		file.open(path, File.READ)
		code = parse_json(file.get_line())
	
	
	var bg = load("res://BG.tscn")
	for i in range(-3, 25):
		var enemy = bg.instance()
		enemy.xs = 1024 * i
		enemy.position.y = -75
		
		add_child(enemy)
		
	
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
	
	if len(xp) == 0:
		xpp = 1000
	else:
		xpp = xp.max() + 1000

	get_node("Player").Mode = code["Mode"]
	
	var bgs = load("res://BG.tscn")
	for i in range(-1, int((xpp/(512/45)))/4):
		var enemy = bgs.instance()
		enemy.xs = 1024 * i
		enemy.position.y = -75 - 405
		
		add_child(enemy)
	
	
	var scene = load("res://Floor.tscn")
	for i in range(-1, int(xpp/(512/45))):
		var enemy = scene.instance()
		enemy.position.x = 1024 * i + 495
		enemy.position.y = 939.5 - 405
		
		add_child(enemy)
	
	
	get_node("Player").position.x = 100
	get_node("Player").position.y = 0
	
	var end = load("res://EndLVL.tscn")
	var enemy = end.instance()
	enemy.position.x = xpp
	enemy.position.y = -1*(92.5) - 405
	add_child(enemy)
	
	part = 0
		





var window
func rot(var type, var node, var x, var y):
	if type == "rect":
		get_node(node).rect_position.x = x
		get_node(node).rect_position.y = y
	if type == "sprite":
		get_node(node).position.x = (window[0]+x)/2
		get_node(node).position.y = (window[1]+y)/2


func _process(delta):
	window = get_node("/root/Main/Vars").window
	
	if visible == true and part == 1:
		ret()
	if visible == false:
		code = null
	rot("rect", "/root/Main/UI/Game/Close", get_node("/root/Main/Camera2D").position.x - window[0] * get_node("/root/Main/Camera2D").zoom.x/2, get_node("/root/Main/Camera2D").position.y - window[1]*get_node("/root/Main/Camera2D").zoom.y/2)
	get_node("/root/Main/UI/Game/Close").rect_scale.x = get_node("/root/Main/Camera2D").zoom.x
	get_node("/root/Main/UI/Game/Close").rect_scale.y = get_node("/root/Main/Camera2D").zoom.y
	get_node("/root/Main/UI/Game/Edit").visible = edit
	rot("rect", "/root/Main/UI/Game/Edit", get_node("/root/Main/Camera2D").position.x - window[0] * get_node("/root/Main/Camera2D").zoom.x/2 + 80, get_node("/root/Main/Camera2D").position.y - window[1]*get_node("/root/Main/Camera2D").zoom.y/2)
	get_node("/root/Main/UI/Game/Edit").rect_scale.x = get_node("/root/Main/Camera2D").zoom.x
	get_node("/root/Main/UI/Game/Edit").rect_scale.y = get_node("/root/Main/Camera2D").zoom.y
		
		




func _on_Close_pressed():
	get_node("/root/Main/Menu").visible = true
	visible = false
