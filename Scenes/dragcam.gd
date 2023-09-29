extends Camera2D

@onready var player := get_parent().get_node("player")
@onready var dragline = get_parent().get_node("dragline")
@onready var trajectory = get_parent().get_node("Trajectory")
var drag = false
var mousestart
var current
@export var maxheight = 400
var minheight = 0
var mode = 0 # Which camera mode is activated
var resetting = false
@onready var playerstart = player.position
# Called when the node enters the scene tree for the first time.
func _ready():
	position = player.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mode == 1:
		if (player.is_on_floor()):
			if (position.y <= player.position.y && !drag):
				resetting = true
				position.y += 10 
			else: resetting = false
	if mode == 0:
		if (position.y <= player.position.y && !drag):
			position.y += 20 
		else: resetting = false
	pass
	
func update_cam(delta):
	drag = true
	#position.y -= 200
	pass

func _input(event: InputEvent) -> void:
	
	if (event.is_pressed() && event.button_index == MOUSE_BUTTON_LEFT):
		mousestart = event.position
		current = position
	if event is InputEventMouseMotion and drag and !resetting:
		if mode == 1:
			var dif = event.position - mousestart
			if (dif.y > minheight):
				position = current - zoom * dif
			if (dif.y > maxheight): position = Vector2(playerstart.x,-maxheight+player.position.y)
			position.x = playerstart.x
		if mode == 0:
			var dif = event.position - mousestart
			if (dif.y > minheight):
				position = current - zoom * dif
			if (dif.y > maxheight): position = Vector2(playerstart.x,-maxheight+player.position.y)
			position.x = playerstart.x
	else: 
		drag = false
