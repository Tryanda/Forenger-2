extends CharacterBody3D

@onready var logger = $AnimationPlayer

func _ready():
	logger.play('cutting')
