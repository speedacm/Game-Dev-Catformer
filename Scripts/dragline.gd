extends Line2D

# onready is now an annotation in godot 4!
@onready var player := get_parent().get_node("player")
@onready var cam = get_parent().get_node("camera")
var vec_start := Vector2.ZERO # starting point of dragline
var vec_fin := Vector2.ZERO # ending point of dragline
@export var vel_multiplier := 1.5
@export var vel_length_max := 2000
# @export var vel_max_modifer := 30

func _input(event: InputEvent) -> void:
	if player.is_on_floor():
		if Input.is_action_just_pressed("Click"):
			show()
			vec_start = get_global_mouse_position()
			points[0] = vec_start
		if Input.is_action_pressed("Click"): #while holding down mouse button
			vec_fin = get_global_mouse_position()
			points[1] = vec_fin
		if Input.is_action_just_released("Click"):
			

			var vel = ((vec_start - vec_fin) * vel_multiplier)
			print(vel.length())

			# Ensure the velocity doesn't exceed vel_length_max
			if vel.length() > vel_length_max:
				player.velocity = vel.normalized() * vel_length_max # fix this rate of slow down (way too harsh rn)
				
			else:
					player.velocity = vel
			print("player velocity:" , player.velocity)
			hide()
		
