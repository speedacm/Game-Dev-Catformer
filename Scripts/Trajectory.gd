extends Line2D

@onready var player = get_parent().get_node("player")
@onready var dragline = get_parent().get_node("dragline")
@onready var cam = get_parent().get_node("camera")
var max_points = 250

func update_trajectory(delta):
	clear_points()
	var pos = player.global_position
	var vel = ((dragline.vec_start - dragline.vec_fin) * dragline.vel_multiplier)
	for i in max_points:
		add_point(pos)
		vel.y += player.gravity * delta
		
		var collision = $collisionobject.move_and_collide(vel * delta, false, true, true)
		$collisionobject.position = pos
		if collision:
			break
		pos += vel * delta


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.is_on_floor():
		if Input.is_action_pressed("Click"):
			show()
			update_trajectory(delta)
			cam.update_cam(delta)
	if Input.is_action_just_released("Click"):
		hide()
	pass
