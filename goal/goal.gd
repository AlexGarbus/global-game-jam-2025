extends Area3D


func _on_body_entered(body: Node3D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://end.tscn")
