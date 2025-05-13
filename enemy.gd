extends Node2D

var marchTimer = 0
var marchTime = 12
var marchDir = 1
var bottomOfScreen = 648

var state = "Patrol"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match state:
		"Patrol":
			pass
		"Descend":
			pass

func die():
	queue_free()
