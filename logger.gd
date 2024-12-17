extends CharacterBody3D

@onready var logger = $AnimationPlayer
@onready var cuttingsfx = $cuttingsfx

func _ready():
	logger.play('cutting')
	cuttingsfx.play() 
