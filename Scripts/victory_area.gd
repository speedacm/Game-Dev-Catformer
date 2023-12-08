extends Node2D

@onready var VictUI = $VictoryUI
@onready var mainUI = get_parent().get_node("UI")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print("body entered")
	VictUI.visible = true
	VictUI.get_node("jumpsout").text = mainUI.get_node("JumpOut").text
	VictUI.get_node("timeout").text = mainUI.get_node("TimerOut").text
	mainUI.visible = false
	get_tree().paused = true
	pass # Replace with function body.
