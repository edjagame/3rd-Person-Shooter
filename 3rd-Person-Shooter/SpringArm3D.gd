extends SpringArm3D

@export var mouse_sensitivity: float = 0.005

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_level = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		
		rotation.x -= event.relative.y * mouse_sensitivity
		rotation.x = clamp(rotation.x, deg_to_rad(-90.0), deg_to_rad(30.0))
		rotation.y -= event.relative.x * mouse_sensitivity
		rotation.y = wrapf(rotation.y, deg_to_rad(0),  deg_to_rad(360.0))
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):	
	pass
	
