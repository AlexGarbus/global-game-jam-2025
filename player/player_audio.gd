extends Node

var _scream_played = false


func _physics_process(delta: float) -> void:
	if not _scream_played and get_parent().global_position.y <= -0.5:
		$Scream.play()
		_scream_played = true


func _on_player_jumped() -> void:
	$Jump.play()


func _on_player_knockback_changed(value: bool) -> void:
	if value:
		$Knockback.play()


func _on_player_powerup_changed(value: bool) -> void:
	if value:
		$PowerupStart.play()
	else:
		$PowerupEnd.play()


func _on_player_powerup_contacted() -> void:
	$PowerupContact.play()
