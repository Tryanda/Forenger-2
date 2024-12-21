extends Node2D

@onready var video_player = $VideoStreamPlayer
@onready var skip_button = $Button

func _ready() -> void:
	# Mengatur autoplay video
	video_player.autoplay = true
	
	# Menghubungkan sinyal saat video selesai
	video_player.finished.connect(_on_video_finished)
	
	# Menghubungkan sinyal tombol "Skip" ke fungsi skip_video
	skip_button.pressed.connect(skip_video)

func _on_video_finished() -> void:
	change_scene_to_next_level()

func change_scene_to_next_level() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func skip_video() -> void:
	# Mengganti scene langsung tanpa menunggu video selesai
	change_scene_to_next_level()
