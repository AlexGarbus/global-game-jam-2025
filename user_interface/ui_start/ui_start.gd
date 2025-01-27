extends Control


func _ready() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_SINE)
	tween.tween_property($Fade, "modulate", Color($Fade.modulate, 0), 1)
	tween.tween_interval(5)
	tween.tween_property($Label, "modulate", Color($Label.modulate, 0), 1)
