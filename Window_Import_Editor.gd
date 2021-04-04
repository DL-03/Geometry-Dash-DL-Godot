extends FileDialog


onready var window = get_node("/root/Main/Vars").window
onready var objectT = get_node("/root/Main/Vars").objectT



func _ready():
	rect_position.x = (window[0])/2 - rect_size.x/2
	rect_position.y = (window[1])/2 - rect_size.y/2


func _on_Window_Import_Editor_file_selected(path):
	get_node("/root/Main/More").visible = false
	get_node("/root/Main/Editor").visible = true
	get_node("/root/Main/Editor").lvl = path
	get_node("/root/Main/Editor").part = 1
