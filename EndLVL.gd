extends Node2D



func _on_cam_body_entered(body):
	if get_node("/root/Main/Game").edit == true:
		get_node("/root/Main/Game").Edit()
	else:
		get_node("/root/Main/Menu").visible = true
		get_node("/root/Main/Game").visible = false

func _process(delta):
	if get_node("/root/Main/Game").visible == false:
		self.queue_free()


