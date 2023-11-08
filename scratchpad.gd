extends CollisionShape2D

@export var friction  = 1.0
signal wall_contact

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scratch_pad_area_entered(area):
	emit_signal('wall_contact')

