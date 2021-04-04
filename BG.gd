extends Node2D


var xs

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player = get_node("/root/Main/Game/Player")
	position.x = xs + player.position.x/4
	if z_index > -1:
		z_index -= 1
	if get_node("/root/Main/Game").visible == false:
		self.queue_free()
