extends WindowDialog

func _process(delta):
	rect_position.x = get_node("/root/Main/Camera2D").position.x - rect_size.x/2*get_node("/root/Main/Camera2D").zoom.x
	rect_position.y = get_node("/root/Main/Camera2D").position.y - rect_size.y/2*get_node("/root/Main/Camera2D").zoom.y
	rect_scale.x = get_node("/root/Main/Camera2D").zoom.x
	rect_scale.y = get_node("/root/Main/Camera2D").zoom.y

func _ready():
	get_node("Save").connect("pressed", self, "Save")
	get_node("Cancel").connect("pressed", self, "Cancel")
	get_node("No").connect("pressed", self, "No")
	
func Cancel():
	hide()
func No():
	get_node("/root/Main/Menu").visible = true
	get_node("/root/Main/Editor").visible = false
	Cancel()
func Save():
	get_node("/root/Main/Editor").SaveB()
	No()
