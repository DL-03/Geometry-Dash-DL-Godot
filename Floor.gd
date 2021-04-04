extends StaticBody2D



func _process(delta):
	if get_node("/root/Main/Game").visible == false and get_node("/root/Main/Editor").visible == false:
		self.queue_free()
