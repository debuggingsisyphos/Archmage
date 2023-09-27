extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	# place player
	get_node("Player").position = map_to_local(Vector2.ZERO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
