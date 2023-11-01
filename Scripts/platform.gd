extends StaticBody2D

@export var friction = 0.1
@onready var stem := get_node("TreeStem")

func get_friction():
	return friction

# Called when the node enters the scene tree for the first time.
func _ready():
	if (stem!=null): 
		stem.global_rotation = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func spawnPipe():
	#print(self.get_child_count())
	print(self.get_children())
