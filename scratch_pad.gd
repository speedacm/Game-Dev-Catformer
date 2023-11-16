extends Area2D
signal wallcontact()
signal wallexit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body != null && !is_connected("wallcontact", body._on_wallcontact):
		connect("wallcontact",body._on_wallcontact)
	emit_signal("wallcontact")
	

func _on_body_exited(body):
	if body != null && !is_connected("wallexit", body._on_wallexit):
		connect("wallexit", body._on_wallexit)
	emit_signal("wallexit")

