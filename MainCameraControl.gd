extends Camera2D

var speed = 5
var zoomIncrements = 1.25
var zoomOutLimit = 4
var zoomInLimit = 0.25
var velocity = Vector2.ZERO
var collectedVector = Vector2.ZERO
var forwardButton = "W"
var backwardsButton = "S"
var leftwardsButton = "A"
var rightwardsButton = "D"


func _input(event):
	cameraMovementControl(event)
	zoomControl(event)

func _process(delta):
	velocity = collectedVector.normalized() * speed * (1/get_zoom().x)
	position += velocity
	
func cameraMovementControl(event):
	if event is InputEventKey:
		if  OS.get_keycode_string(event.keycode) == forwardButton:
			if event.is_pressed():
				collectedVector.y = -1
			if event.is_released():
				collectedVector.y = 0
		if OS.get_keycode_string(event.keycode) == backwardsButton:
			if event.is_pressed():
				collectedVector.y = 1
			if event.is_released():
				collectedVector.y = 0
		if OS.get_keycode_string(event.keycode) == leftwardsButton:
			if event.is_pressed():
				collectedVector.x = -1
			if event.is_released():
				collectedVector.x = 0
		if OS.get_keycode_string(event.keycode) == rightwardsButton:
			if event.is_pressed():
				collectedVector.x = 1
			if event.is_released():
				collectedVector.x = 0
	
func zoomControl(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var currentZoom = get_zoom()
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				if currentZoom.x < zoomOutLimit and currentZoom.y < zoomOutLimit:
					set_zoom(Vector2(currentZoom.x*zoomIncrements,currentZoom.y*zoomIncrements))
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				if currentZoom.x > zoomInLimit and currentZoom.y > zoomInLimit:
					set_zoom(Vector2(currentZoom.x/zoomIncrements,currentZoom.y/zoomIncrements))
			
		
