extends Camera2D

@onready var dragline = get_parent().get_node("dragline")
@onready var player := get_parent()
var mousestart
var current
var dif
@export var maxheight = 400
var minheight = 0
var mode = 0 # Which camera mode is activated
var resetting = false
@onready var playerstart = player.position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	if (position.y <= 0 && !dragline.jump_attempt):
		position.y += 20
	global_position.x = playerstart.x
	pass

#func update_cam(delta):
	#drag = true
	#position.y -= 200
	#pass

func _input(event: InputEvent) -> void:
	
	if (event is InputEventMouse):
		if (event.is_pressed() && event.button_index == MOUSE_BUTTON_LEFT):
			mousestart = event.position
			current = position
	if (event is InputEventMouseMotion && dragline.jump_attempt):

		dif = event.position - mousestart
		if (dif.y > minheight):
			position = current - zoom * dif
		if (dif.y > maxheight): position.y = -maxheight
		global_position.x = playerstart.x
