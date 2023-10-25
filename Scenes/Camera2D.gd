extends Camera2D

@onready var player := get_parent()
var drag = false
var mousestart
var current
var dif
@export var max_y= 200
var min_y = 0
var mode = 0 # Which camera mode is activated
var resetting = false
@onready var playerstart = player.position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("Click")):
		drag = true
	elif (Input.is_action_just_released("Click")): 
		drag = false
	if (position.y <= 0 && !drag):
		position.y += 20
	#global_position.x = playerstart.x
	pass

func _input(event: InputEvent) -> void:

	if (event is InputEventMouse):
		if (event.is_pressed() && event.button_index == MOUSE_BUTTON_LEFT):
			mousestart = event.position.y
			current = position
			print(dif)
	if (event is InputEventMouseMotion && drag):
		
		dif.y = event.position.y - mousestart
		print(dif)
		if (dif.y > min_y):
			position = current - zoom * dif
			#position = current - dif
		if (dif.y > max_y): position.y = -max_y
		#global_position.x = playerstart.x
