extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y -= 12 #move up
	
	if global_position.y < 0: #clear when off screen
		queue_free()
		
	if $Area2D.has_overlapping_areas():
		for i in $Area2D.get_overlapping_areas():
			if i.get_parent().is_in_group("Enemy"):
				i.get_parent().die()
				queue_free()
