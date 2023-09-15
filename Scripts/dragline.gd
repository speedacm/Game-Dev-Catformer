extends Line2D

# onready is now an annotation in godot 4!
@onready var player := get_parent().get_node("player")
var vec_start := Vector2.ZERO # starting point of dragline
var vec_fin := Vector2.ZERO # ending point of dragline
@export var vec_multiplier := 2.5

func _input(event: InputEvent) -> void:
	if player.is_on_floor():
		if Input.is_action_just_pressed("Click"):
			show()
			vec_start = get_global_mouse_position()
			vec_fin - vec_start
			points[0] = vec_start
		if Input.is_action_pressed("Click"): #while holding down mouse button
			vec_fin = get_global_mouse_position()
			points[1] = vec_fin
		if Input.is_action_just_released("Click"):
			
			## I dont know if this works - trying to add a kind of 'maxspeed' by checking the length of the vel vector and normalizing if it exceeds that  
			var vel = ((vec_start - vec_fin) * vec_multiplier)
			if vel.length() > 100:
				vel.normalized() * 30
			player.velocity = vel
			hide()
		
