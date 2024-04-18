extends Node3D
@export var speed: float = 100.0
const particles = preload("res://scenes/particles.tscn")
@onready var mesh = $MeshInstance3D
@onready var collision = $CollisionShape3D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= transform.basis * Vector3(0,0,speed) * delta

func _on_area_entered(area):
	on_collision(area)
func _on_body_entered(body):
	on_collision(body)

func on_collision(collider):
	var particle_instance = particles.instantiate()
	particle_instance.global_position = position
	mesh.hide()
	collision.hide()
	get_parent().add_child(particle_instance)


func _on_no_collision_timeout_timeout():
	queue_free()
