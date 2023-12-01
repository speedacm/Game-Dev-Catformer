extends Line2D

@onready var player = get_parent().get_node("player")
@onready var dragline = get_parent().get_node("dragline")
var max_points = 60


func update_trajectory(delta):
	clear_points()
	var pos = player.global_position
	var vel = ((dragline.vec_start - dragline.vec_fin) * dragline.vel_multiplier)

	# Ensure velocity doesn't exceed vel_length_max and turn trajectory indicator red if velocity is at its maximum
	if (vel.length() > dragline.vel_length_max):
		vel = vel.normalized() * dragline.vel_length_max
		default_color = Color.RED
	else:
		default_color = Color.WHITE
	# Plot points

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
	if dragline.jump_attempt:
		show()
		update_trajectory(delta)
	else:
		dragline.visible = false
		hide()
	pass
