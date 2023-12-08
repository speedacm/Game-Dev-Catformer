extends Control

@onready var main_menu = $CanvasLayer
@onready var playButton = $CanvasLayer/Buttons/ButtonsContainer/Button_Play
@onready var level1 = get_parent().get_node('Level1')
@onready var level2 = get_parent().get_node('level 2')



'''
Additional notes:
9/29/23
- Main Menu changed as a 'stream lined' process
	-> user will be able to see the bottom part of the level
	   with a cat sleeping on a bed
	-> when the user presses 'new game' then the cat will wake up
	   pop up will show instructions on what to do
	   [will erase the user's position coords for checkpoints]
	
	-> if user has some data saved, a button will pop up as 'Continue game'
	   if clicked, game will fade-into a black screen; game should change
	   the cat's position to the desired checkpoint

'''
var startGame = "res://Scenes/main.tscn"
func onSwitchScene():
	get_tree().change_scene_to_file(startGame)

func _ready():
	print("Main Menu Boot")

func _on_button_play_pressed():
	var player = get_parent().get_node("Cat")
	player.get_node('player').sleeping = false
	get_parent().menuexists = false
	queue_free()



func _on_button_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_button_close_tutorials_pressed():
	var signs = level1.get_tree().get_nodes_in_group("Signs") + level2.get_tree().get_nodes_in_group("signs")
	for x in signs:
		print(x)
		if x.visible == true:
			x.visible = false
		else:
			x.visible = true
	pass # Replace with function body.
	

		
	


