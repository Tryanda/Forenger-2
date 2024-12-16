extends CharacterBody3D

@onready var animation = $AnimationPlayer

func _physics_process(delta: float) -> void:
	animation.play('walk')
