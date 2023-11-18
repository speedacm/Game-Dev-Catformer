extends CharacterBody2D

@onready var dragline = get_parent().get_node("dragline")
const SPEED = 600.0
const SMALL_JUMP_VELOCITY = -700
const JUMP_VELOCITY = -400.0
var friction = 0
var mouse_start := Vector2.ZERO # starting point of dragline
var mouse_fin := Vector2.ZERO # ending point of dragline
var draglinedif := Vector2.ZERO
var facing = ''
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var canhold = false
var canwalljump = false
var exiting = false
#get_node(preload("res://Scenes/scratch_pad.tscn").connect("wall_contact",self,"_on_wall_entered")
var smallHopping = false

func _physics_process(delta):
	# Add the gravity.
	
	if not is_on_floor():
		velocity.y += gravity * delta
	var movement = move_and_slide()
	
	if get_last_slide_collision() != null:
		friction = get_last_slide_collision().get_collider().get_friction()
	
	if is_on_floor():
		smallHopping = false
		if (Input.is_action_just_pressed("space") and not dragline.jump_attempt):
			velocity.y = SMALL_JUMP_VELOCITY
			smallHopping = true
	if is_on_floor() or smallHopping:
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0 , SPEED*friction)

	if position.y > 1800:
		position.y = 485
		position.x = 544

	if Input.is_action_pressed("hold") && canhold == true:
		if Input.is_action_just_released("Click"):
			canhold = false
		else:
			velocity = Vector2(0,30)
		move_and_slide()
		pass
		
#func _on_wall_entered():
	


	#Animations
	#Flip Sprite when changing direction
	if (velocity.x>0): $Sprite2D.flip_h = false 
	elif (velocity.x<0): $Sprite2D.flip_h = true
	
	if is_on_floor():
		#Play walk animation if moving on floor
		if (velocity.x!=0): $AnimationPlayer.play("Walk")
		#Play charge animation if dragging mouse
		elif (Input.is_action_just_pressed("Click")):
			mouse_start = get_global_mouse_position()
		elif (dragline.jump_attempt == true): 
			$AnimationPlayer.play("Jump Charge")
			mouse_fin = get_global_mouse_position()
			draglinedif = mouse_start - mouse_fin
			if (draglinedif.x>0): $Sprite2D.flip_h = false
			if (draglinedif.x<0): $Sprite2D.flip_h = true
		else: $AnimationPlayer.play("Idle") #Play Idle if no velocity
		
		#Rotate Sprite2D on slopesee
		var normal: Vector2 = get_floor_normal()
		var offset: float = deg_to_rad(90)
		if ($SlopeDetector.is_colliding()):
			if ($SlopeDetector.get_collider().rotation !=0):
				$Sprite2D.rotation = normal.angle() + offset
				$Sprite2D.position.y = offset
			else: resetSprite()


	#Jump Animation
	if not is_on_floor():
		resetSprite() #Reset cat rotation when leaving ground
		if (velocity.y < 0): $AnimationPlayer.play("Jump_Release")
		if (velocity.y > 0): $AnimationPlayer.play("Fall")
		
func resetSprite():
	$Sprite2D.rotation = 0
	$Sprite2D.position.y = -22
	
	
func _on_wallcontact():
		canhold = true
		canwalljump = true
		
		
func _on_wallexit():
	canhold = false
	canwalljump = false
	
	
