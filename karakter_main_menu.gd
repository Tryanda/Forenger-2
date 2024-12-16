extends CharacterBody3D

@onready var animation = $AnimationPlayer

func _physics_process(delta: float) -> void:
	animation.play('idle') 

func _on_texture_button_pressed() -> void:
	get_tree().quit() 
