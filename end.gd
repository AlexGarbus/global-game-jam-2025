extends Node


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://main.tscn")
