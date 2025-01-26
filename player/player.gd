extends RigidBody3D


@export var move_force = 5.0
@export var jump_force = 4.5
@export var powerup_mass = 0.5
@export var max_powerup_contacts = 10


var _powerup = false:
	get:
		return _powerup
	set(value):
		_powerup = value
		_powerup_contacts = 0
		$Pivot/Bubble.visible = value
		$SphereShape.set_deferred("disabled", !value)
		physics_material_override.bounce = int(_powerup)
		mass = powerup_mass if value else 1

var _powerup_contacts = 0


func _physics_process(delta: float) -> void:
	# Handle jump.
	$FloorDetector.global_transform.origin = global_transform.origin
	if Input.is_action_just_pressed("jump") and $FloorDetector.is_colliding():
		apply_impulse(Vector3.UP * jump_force)

	# Get the input direction and handle the movement.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		$Pivot.basis = Basis.looking_at(direction)
		apply_force(Vector3(direction.x, 0, direction.z) * move_force)


func _exit_tree() -> void:
	physics_material_override.bounce = 0

func _on_pickup_detector_area_entered(area: Area3D) -> void:
	_powerup = true
	area.queue_free()


func _on_body_entered(body: Node) -> void:
	if _powerup:
		_powerup_contacts += 1
		if _powerup_contacts == max_powerup_contacts:
			_powerup = false
