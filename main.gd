extends Node


var rng = RandomNumberGenerator.new()


func _ready() -> void:
	rng.randomize()
	$StartPath/PathFollow3D.progress_ratio = rng.randf()


func _on_start_timer_timeout() -> void:
	$Player.global_transform.origin = $StartPath/PathFollow3D.global_transform.origin


func _on_world_boundary_body_entered(body: Node3D) -> void:
	get_tree().call_deferred("reload_current_scene")
