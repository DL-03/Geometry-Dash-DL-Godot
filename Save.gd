extends FileDialog


onready var window = get_node("/root/Main/Vars").window




func _process(delta):
	rect_position.x = get_node("/root/Main/Camera2D").position.x - rect_size.x/2*get_node("/root/Main/Camera2D").zoom.x
	rect_position.y = get_node("/root/Main/Camera2D").position.y - rect_size.y/2*get_node("/root/Main/Camera2D").zoom.y
	rect_scale.x = get_node("/root/Main/Camera2D").zoom.x
	rect_scale.y = get_node("/root/Main/Camera2D").zoom.y








func _on_Save_confirmed():
	var save_game = File.new()
	save_game.open(current_path, File.WRITE)
	save_game.store_line(to_json(get_node("/root/Main/Editor").code))
	save_game.close()
