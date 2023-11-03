extends Line2D
@onready var player := find_parent("player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent) -> void:
	if player.is_on_floor():
		if Input.is_action_just_pressed("Click"):
			show()
			points[0] = get_local_mouse_position()
		if Input.is_action_pressed("Click"): #while holding down mouse button
			points[1] = get_local_mouse_position()
		if Input.is_action_just_released("Click"):
			hide()
		if Input.is_action_just_pressed("c"):
			hide()
		
