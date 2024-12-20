extends Node3D

@export var logger_scene = preload("res://logger.tscn") # Memuat scene musuh
@onready var enemy_timer = $EnemyTimer # Menghubungkan timer untuk spawn musuh
@onready var countdown_timer = $CountdownTimer # Menghubungkan timer untuk hitungan mundur
@onready var countdown_label = $CountdownLabel # Menghubungkan label untuk menampilkan countdown

# Variabel untuk melacak apakah logger sudah dibuat
var is_logger_spawned = false

func _ready():
	enemy_timer.timeout.connect(_on_Enemy_Timer_timeout) 
	countdown_timer.timeout.connect(_on_CountdownTimer_timeout)
	countdown_timer.wait_time = 90 # Set waktu hitung mundur ke 90 detik
	enemy_timer.start() # Memulai timer spawn musuh
	countdown_timer.start() # Memulai hitungan mundur

func _process(delta):
	if not countdown_timer.is_stopped():
		var time_left = int(countdown_timer.time_left)
		var minutes = time_left / 60
		var seconds = time_left % 60
		countdown_label.text = str("%02d:%02d" % [minutes, seconds])

func _on_back_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn") # Kembali ke menu

func _on_Enemy_Timer_timeout() -> void:
	pass
	# Cek apakah logger sudah ada
	#if not is_logger_spawned:
		#var trees = get_tree().get_nodes_in_group("trees")
		#var trees1 = get_tree().get_nodes_in_group("trees1")
		#var all_trees = trees + trees1
		#
		#if all_trees.size() > 0: 
			#var tree = all_trees[randi() % all_trees.size()]
			#var enemy = logger_scene.instantiate()
			#var offset_x = randf_range(-3.0, 3.0)
			#var offset_z = randf_range(-3.0, 3.0)
			#enemy.global_position = tree.global_position + Vector3(offset_x, 0, offset_z)
			#get_tree().get_root().add_child(enemy)
			#is_logger_spawned = true # Tandai bahwa logger sudah dibuat

func _on_CountdownTimer_timeout() -> void:
	game_over()

func game_over():
	print("Game Over! Waktu habis.")
	get_tree().change_scene_to_file("res://GameOver.tscn")
