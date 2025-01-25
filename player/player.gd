extends RigidBody3D


@export var move_force = 5.0
@export var jump_force = 4.5


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
