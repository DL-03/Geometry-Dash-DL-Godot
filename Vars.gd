extends Node2D

var window = [0, 0]
var mouse = [0, 0]
var objectT = {
"Nblock1": "block", 
"Mblock1": "block", 
"Mblock2": "block", 
"Mblock3": "block", 
"Mblock4": "block", 
"Mblock5": "block", 
"Mblock6": "block", 
"Mblock7": "block", 
"Mblock8": "block", 
"NHalfblock1": "half block", 
"Nspike1": "spike",
"Lspike1": "half spike",
"NHalfspike1": "half spike",
"Pcube": "portal",
"Pship": "portal"}

func _process(delta):
	window = OS.get_window_size()
func _physics_process(delta):
	mouse[0] = get_viewport().get_mouse_position().x
	mouse[1] = get_viewport().get_mouse_position().y
