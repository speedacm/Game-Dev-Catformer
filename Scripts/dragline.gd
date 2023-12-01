extends Line2D

@onready var player := get_parent().get_node("player")
@onready var ui := get_parent().get_parent().get_node('UI')
@export var vel_multiplier := 1.5
@export var vel_length_max := 2000

var vec_start := Vector2.ZERO # starting point of dragline
var vec_fin := Vector2.ZERO # ending point of dragline
var jump_attempt = false
var hopping = false

signal jumped()

func _ready():
	connect("jumped", ui._on_jump)


func _input(event: InputEvent) -> void:
	if player.is_on_floor() || player.canwalljump == true:
		
		if Input.is_action_just_pressed("Click"):
			jump_attempt = true
			show()
			vec_start = get_viewport().get_mouse_position()

		if Input.is_action_pressed("Click"): #while holding down mouse button
			vec_fin = get_viewport().get_mouse_position()

		if Input.is_action_just_released("Click") and jump_attempt == true:
			jump_attempt = false
			player.canwalljump = false
			var velAdjust
			var vel = ((vec_start - vec_fin) * vel_multiplier)
			emit_signal("jumped")

			if(player.get_last_slide_collision() != null):
				velAdjust = player.get_last_slide_collision().get_collider_velocity()
			else:
				velAdjust = Vector2(0, 0)
			# Ensure the velocity doesn't exceed vel_length_max
			if vel.length() > vel_length_max:
				player.velocity = (vel.normalized() * vel_length_max) - velAdjust # fix this rate of slow down (way too harsh rn)
				
			else:
					player.velocity = (vel) - velAdjust
			hide()
		if Input.is_action_just_pressed("c"):
			jump_attempt = false
		else:
			hide()
		
