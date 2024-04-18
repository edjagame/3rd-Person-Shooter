extends Node3D
signal bullet_collided
@export var speed: float = 100.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= transform.basis * Vector3(0,0,speed) * delta

func _on_timer_timeout():
	queue_free()

func _on_area_entered(area):
	on_collision()
func _on_body_entered(body):
	on_collision()

func on_collision():
	bullet_collided.emit()
	queue_free()
