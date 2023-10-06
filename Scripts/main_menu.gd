extends Control

@onready var main_menu = $CanvasLayer
@onready var playButton = $CanvasLayer/Buttons/ButtonsContainer/Button_Play
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
	onSwitchScene()
