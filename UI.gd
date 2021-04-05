extends Node2D

func Visible(var node):
	get_node(node).visible = get_node("/root/Main/" + node).visible

var Tran

func _process(delta):
	Tran = get_node("/root/Main/Vars/Language")
	Visible("Menu")
	Visible("Game")
	Visible("More")
	Visible("Editor")

	get_node("Menu/Import/Label").text = Tran.Tran("Import")
	get_node("More/New").text = Tran.Tran("New")
	get_node("More/Open").text = Tran.Tran("Open")
	get_node("/root/Main/Menu/Close Game").window_title = Tran.Tran("Close Game") + "?"
	get_node("/root/Main/Menu/Close Game/Ok").text = Tran.Tran("Ok")
	get_node("/root/Main/Menu/Close Game/Cancel").text = Tran.Tran("Cancel")
	get_node("/root/Main/Menu/Close Game/Label").text = Tran.Tran("Close Game") + "?"
	get_node("Editor/SaveB").text = Tran.Tran("Save")
	get_node("Editor/Save_As").text = Tran.Tran("Save As")
	get_node("Editor/Delete").text = Tran.Tran("Delete")
	get_node("/root/Main/Window/Close").window_title = Tran.Tran("Extra") + " " + Tran.Tran("Save")
	get_node("/root/Main/Window/Close/Label").text = Tran.Tran("Extra") + " " + Tran.Tran("Save")
	get_node("/root/Main/Window/Close/Save").text = Tran.Tran("Save")
	get_node("/root/Main/Window/Close/Cancel").text = Tran.Tran("Cancel")
	get_node("/root/Main/Window/Close/No").text = Tran.Tran("No")
