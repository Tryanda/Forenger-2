extends CanvasLayer

@onready var run = $run
@onready var jump = $jump
@onready var catch = $catch


func _on_run_pressed() -> void:
	run.modulate.a = 0.5

func _on_run_released() -> void:
	run.modulate.a = 1.0
	
func _on_jump_pressed() -> void:
	jump.modulate.a = 0.5
	
func _on_jump_released() -> void:
	jump.modulate.a = 1.0

func _on_catch_pressed() -> void:
	catch.modulate.a = 0.5
	
func _on_catch_released() -> void:
	catch.modulate.a = 1.0
