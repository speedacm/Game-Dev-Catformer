extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -400.0
var friction = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	
	if not is_on_floor():
		velocity.y += gravity * delta
	var movement = move_and_slide()
	
	if get_last_slide_collision() != null:
		friction = get_last_slide_collision().get_collider().get_friction()
		print(friction)
	
	if is_on_floor():
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0 , SPEED*friction)
	if position.y > 1800:
		position.y = 485
		position.x = 544


