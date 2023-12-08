extends Node2D

@onready var mainmenu = preload("res://Scenes/ui/main_menu.tscn")
var menuexists = false
var menu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("esc") && get_node("Cat").get_node("player").sleeping == false:
		if menuexists == false:
			menu = mainmenu.instantiate()
			add_child(menu)
			menuexists = true
		else:
			menu._on_button_play_pressed()

			
		
			
