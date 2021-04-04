extends KinematicBody2D

var Mode = "cube"

var speed = 350

var jumpForce = 700
var gravity = 2700

var vel = Vector2()

var but = [0, 0]

onready var part = get_node("CPUParticles2D")
onready var player = get_node("cube")
onready var ship = get_node("ship")

var rot = -1


func Cube(delta):
	player.position.x = 0
	player.position.y = 0
	player.scale.x = 1
	player.scale.y = 1
	ship.visible = false
	if Mode == 'cube_platformer':

		vel.x = 0
	
	
	
		if Input.is_action_pressed("player_left") or but[0]:
			vel.x -= speed
			part.position.x = 21
			rot = 1
		if Input.is_action_pressed("player_right") or but[1]:
			vel.x += speed
			part.position.x = -21
			rot = -1
			
		
	
	if is_on_floor() == false:
		vel.y += gravity * delta - 3
	
	if Mode == "cube_platformer":
		if Input.is_action_pressed("player_up") and is_on_floor():
			vel.y = 0
			vel.y -= jumpForce - 3
	
	if Mode == "cube":
		rot = -1
		vel.x = speed
		if (Input.is_action_pressed("left_mouse") or Input.is_action_pressed("player_up")) and is_on_floor():
			vel.y = 0
			vel.y -= jumpForce - 3
		if is_on_ceiling():
			position.x = 100
			position.y = 0
		if is_on_wall():
			position.x = 100
			position.y = 0
		
	
	if Mode == "cube" or Mode == "cube_platformer":
		
		part.gravity.x = vel.x / -4
	
		if vel.x == 0 or is_on_floor() == false:
			part.emitting = false
		else:
			part.emitting = true
		
		if is_on_floor() or (vel.x < 5 and vel.x > -5):
			player.rotation = round(player.rotation/1.5708)*1.5708
		else:
			player.rotation -= 0.1 * rot
		if player.rotation > 6 or player.rotation < -6:
			player.rotation = 0


func _physics_process(delta):
	if Mode == "cube" or Mode == "cube_platformer":
		Cube(delta)
	if Mode == "ship":
		player.rotation = 0
		rot = -1
		vel.x = speed
		part.emitting = false
		if is_on_floor():
			vel.y = 0
		
		player.position.x = 2.5
		player.position.y = -5
		player.scale.x = 0.6
		player.scale.y = 0.6
		ship.visible = true
		vel.y += gravity/2 * delta - 3
		if Input.is_action_pressed("left_mouse") or Input.is_action_pressed("player_up"):
			vel.y -= jumpForce/15 - 3
		
		
		if is_on_ceiling():
			position.x = 100
			position.y = 0
		if is_on_wall():
			position.x = 100
			position.y = 0
	if is_on_ceiling():
		vel.y = 1
	

	move_and_slide(vel, Vector2.UP)

	
	





