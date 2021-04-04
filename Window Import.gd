extends FileDialog

onready var window = get_node("/root/Main/Vars").window




func _ready():
	rect_position.x = (window[0])/2 - rect_size.x/2
	rect_position.y = (window[1])/2 - rect_size.y/2





func _on_Window_Import_file_selected(path):
	get_node("/root/Main/Menu").visible = false
	get_node("/root/Main/Game").visible = true
	get_node("/root/Main/Game").lvl = path
	get_node("/root/Main/Game").part = 1
