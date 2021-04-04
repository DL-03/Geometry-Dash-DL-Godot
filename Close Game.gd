extends WindowDialog

onready var window = get_node("/root/Main/Vars").window

func _ready():
	rect_position.x = (window[0])/2 - rect_size.x/2
	rect_position.y = (window[1])/2 - rect_size.y/2
	get_node("Ok").connect("pressed", self, "Ok")
	get_node("Cancel").connect("pressed", self, "Cancel")

func Ok():
	get_tree().quit()

func Cancel():
	get_node("/root/Main/Menu/Close Game").hide()
