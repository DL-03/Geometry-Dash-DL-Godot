extends Camera2D

var window

func _process(delta):
	window = get_node("/root/Main/Vars").window
	if get_node("/root/Main/Game").visible == true:
		current = true
		zoom.x = 1
		zoom.y = 1
		if get_node("/root/Main/Game/Player").position.x > get_node("/root/Main/Game").xpp - (window[0]/2):
			position.x = get_node("/root/Main/Game").xpp - (window[0]/2)
		else:
			position.x = get_node("/root/Main/Game/Player").position.x
		position.y = get_node("/root/Main/Game/Player").position.y - 120
	elif get_node("/root/Main/Editor").visible == true:
		current = true
		if Input.is_action_pressed("cam_up"):
			position.y -= 20
		if Input.is_action_pressed("cam_down"):
			position.y += 20
		if Input.is_action_pressed("cam_left"):
			position.x -= 20
		if Input.is_action_pressed("cam_right"):
			position.x += 20
		zoom.x = 1.25
		zoom.y = 1.25
	else:
		current = true
		position.x = window[0]/2
		position.y = window[1]/2
		zoom.x = 1
		zoom.y = 1
		current = false
		

	
