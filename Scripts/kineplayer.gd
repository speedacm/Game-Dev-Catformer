extends RigidBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -400.0
var friction = 0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _integrate_forces(state):
	# Add the gravity.
	if not on_floor():
	#	linear_velocity += gravity * delta
		pass
		
	"""var movement = move_and_slide()
	if get_last_slide_collision() != null:
		friction = get_last_slide_collision().get_collider().get_friction()
		print(friction)"""
	
	if on_floor():
		var direction = Input.get_axis("ui_left", "ui_right")
		rotation = 0
		if direction:
			linear_velocity.x = direction * SPEED
		else:
			linear_velocity.x = move_toward(linear_velocity.x, 0 , SPEED*friction)
	
			
func on_floor():
	if linear_velocity.x == 0 && linear_velocity.y == 0:
		return true
	return false
	


