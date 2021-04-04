extends StaticBody2D


var type
var img

onready var ico = get_node("ico")
onready var block = get_node("block")
onready var half_block = get_node("half block")
onready var spike = get_node("Area2D/spike")
onready var half_spike = get_node("Area2D/half spike")
onready var portal = get_node("portal/portal")

func _ready():
	ico.texture = load("res://Resources/Objects/" + img + ".png")
	if type == "block":
		block.disabled = false
	if type == "half block":
		half_block.disabled = false
	if type == "spike":
		spike.disabled = false
	if type == "half spike":
		half_spike.disabled = false
	if type == "portal":
		portal.disabled = false

func _process(delta):
	if get_node("/root/Main/Game").visible == false and get_node("/root/Main/Editor").visible == false:
		self.queue_free()
	if get_node("/root/Main/Editor").DeleteO != null:
		if get_node("/root/Main/Editor").DeleteO[0] == position.x and get_node("/root/Main/Editor").DeleteO[1] == position.y:
			var code = get_node("/root/Main/Editor").code
			for i in range(0, len(code["Code"])):
				var xs = code['Code'][i].get('x')
				var xs2 = code['Code'][i].get('xo')
				var ys = code['Code'][i].get('y')
				var ys2 = code['Code'][i].get('yo')
				var xs3 = 0
				var ys3 = 0
				if xs != null:
					xs3 += xs
				if xs2 != null:
					xs3 += xs2*45
				if ys != null:
					ys3 += ys
				if ys2 != null:
					ys3 += ys2*45
				ys3 *= -1
				if xs3 == get_node("/root/Main/Editor").DeleteO[0] and ys3 == get_node("/root/Main/Editor").DeleteO[1]:
					code["Code"].remove(i)
					get_node("/root/Main/Editor").DeleteO = null
					self.queue_free()
					break


func _on_Area2D_body_entered(body):
	get_node('/root/Main/Game/Player').position.x = 100
	get_node('/root/Main/Game/Player').position.y = 0
	



func _on_portal_body_entered(body):
	var y = ''
	for t in range(0, img.length()):
		if t != 0:
			y += img[t]
	get_node('/root/Main/Game/Player').Mode = y
