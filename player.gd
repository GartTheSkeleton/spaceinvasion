extends Node2D

var bullet = preload("res://player_bullet.tscn")

var speed = 4

var moveValue = 0

var leftBound = 28
var rightBound = 1128

var shootTime = 30
var shootTimer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Left"): #Move Left
		if moveValue != -1:
			moveValue -= 1
	elif Input.is_action_pressed("Right"): #Move Right
		if moveValue != 1:
			moveValue += 1
	else:
		moveValue = 0
		
	if Input.is_action_just_pressed("Space"): #Shoot
		if shootTimer <= 0:
			var createBullet = bullet.instantiate()
			createBullet.global_position = global_position
			add_sibling(createBullet)
			
			shootTimer = shootTime
	
	if shootTimer > 0:
		shootTimer -= 1
	
	print("moveValue = " + str(moveValue)) #See Move Value
	
	if moveValue != 0: #Apply Movement
		global_position.x += moveValue * speed
	
	if global_position.x > rightBound: #Bound Movement
		global_position.x = rightBound
	elif global_position.x < leftBound:
		global_position.x = leftBound
