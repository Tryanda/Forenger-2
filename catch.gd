extends Node2D

func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
