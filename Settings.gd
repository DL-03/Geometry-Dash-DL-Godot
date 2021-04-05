extends WindowDialog

var Tran

func _process(delta):
	Tran = get_node("/root/Main/Vars/Language")
	window_title = Tran.Tran("Settings")
	get_node("Language/Label").text = Tran.Tran("Language")
	Tran.S = get_node("Language/List").text

	
