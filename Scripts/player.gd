extends RigidBody2D

var dir := Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	linear_velocity = dir
	dir = lerp(dir, Vector2.ZERO, 0.02) #linear interpolation  - will slow character down. Prob remove when we add real trajectory?
	pass
