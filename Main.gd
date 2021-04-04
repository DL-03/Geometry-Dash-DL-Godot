extends Node2D



func _ready():
	get_node("/root/Main/Menu").visible = true

func _process(delta):
	if Input.is_action_just_pressed("ScreenF"):
		OS.window_fullscreen = !OS.window_fullscreen
