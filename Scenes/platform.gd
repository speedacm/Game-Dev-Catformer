extends StaticBody2D

#@onready var coll = $collshape/Friction.friction
@onready var coll = $CollisionShape2D/Friction.friction


func get_friction():
	#return $collshape/Friction.friction
	return $CollisionShape2D/Friction.friction

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
