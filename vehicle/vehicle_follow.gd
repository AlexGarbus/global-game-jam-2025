extends PathFollow3D


@export var cycle_time = 10


func _ready() -> void:
	var tween = create_tween()
	tween.tween_method(set_progress_ratio, 0.0, 1.0, cycle_time)
	tween.set_loops().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
