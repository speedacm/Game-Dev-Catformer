extends CanvasLayer

@onready var timer = get_node('Timer')
@onready var timerOut = get_node('TimerOut')
@onready var jumpCounterOut = get_node('JumpOut')
@onready var highestprogOut = get_node('HighestProgOut')
@onready var player = get_parent().get_node('Cat').get_node('player')

@onready var secCount = 0
@onready var minCount = 0
@onready var started = false
@onready var jumpCounter = 0
@onready var highestpos = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not player.sleeping && started == false:
		timer.start()
		started = true
	check_reset_timer()
	
	highestprog()

func highestprog():
	var position = player.position.y
	if position < highestpos:
		highestpos = position
		highestprogOut.text = ":%02d" % (-highestpos/400) + "/100"
		
	


func _on_timer_timeout():
	secCount += 1
	if secCount == 60:
		minCount += 1
		secCount = 0
	timerOut.text = "%d" % minCount + ":%02d" % secCount
	pass # Replace with function body.
	
func check_reset_timer():
	if player.position.y > 700:
		print("timer reset")
		secCount = 0
		minCount = 0
		timerOut.text = "%d" % minCount + ":%02d" % secCount
		jumpCounter = 0
		jumpCounterOut.text = str(jumpCounter)

	
func _on_jump():
	jumpCounter += 1
	jumpCounterOut.text = str(jumpCounter)
	
	
	# string formatting:::  var result = "The sum of %d and %d is %d." % (a, b, a + b)
