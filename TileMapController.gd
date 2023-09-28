extends TileMap

@export var character_speed: float = 400
var character
var path = []
var map


func _ready():
	character = get_node("Player")
	character.position = map_to_local(Vector2.ZERO) 

func _unhandled_input(event):
	if event is InputEventMouseButton:
		var localMousePosition = get_local_mouse_position()
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			var hex_clicked =local_to_map(localMousePosition)
			var hex_center = map_to_local(hex_clicked)
			_update_navigation_path(character.position, localMousePosition)


func _process(delta):
	var walk_distance = character_speed * delta
	move_along_path(walk_distance)


func setup_navserver():

	# create a new navigation map
	map = get_navigation_map(1)
	NavigationServer2D.map_set_active(map, true)

	# create a new navigation region and add it to the map
	var region = NavigationServer2D.region_create()
	NavigationServer2D.region_set_transform(region, Transform3D())
	NavigationServer2D.region_set_map(region, map)

	# sets navigation mesh for the region
	var navigation_poly = NavigationMesh.new()
	navigation_poly = $Navmesh.navigation_polygon
	NavigationServer2D.region_set_navigation_polygon(region, navigation_poly)

	# wait for Navigation2DServer sync to adapt to made changes
	await get_tree().physics_frame


func move_along_path(distance):
	var last_point = character.position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		# The position to move to falls between two points.
		if distance <= distance_between_points:
			character.position = last_point.lerp(path[0], distance / distance_between_points)
			return
		# The position is past the end of the segment.
		distance -= distance_between_points
		last_point = path[0]
		path.remove_at(0)
	# The character reached the end of the path.
	character.position = last_point
	set_process(false)


func _update_navigation_path(start_position, end_position):
	# map_get_path is part of the avigation2DServer class.
	# It returns a PoolVector2Array of points that lead you
	# from the start_position to the end_position.
	path = NavigationServer2D.map_get_path(get_world_2d().navigation_map,start_position, end_position, true)
	print(path)
	# path = NavigationServer2D.map_get_path(map,start_position, end_position, true)
	# The first point is always the start_position.
	# We don't need it in this example as it corresponds to the character's position.
	set_process(true)

