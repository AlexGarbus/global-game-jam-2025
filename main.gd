extends Node


var rng = RandomNumberGenerator.new()


func _ready() -> void:
	rng.randomize()
	$StartPath/PathFollow3D.progress_ratio = rng.randf()


func _on_start_timer_timeout() -> void:
	$Player.global_position = $StartPath/PathFollow3D.global_position
	$Player/Pivot.look_at(Vector3(0, $Player/Pivot.global_position.y, 0))


func _on_world_boundary_body_entered(body: Node3D) -> void:
	get_tree().call_deferred("reload_current_scene")
