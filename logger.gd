extends CharacterBody3D

class_name Logger

@onready var Animationlogger = $AnimationPlayer
@onready var cuttingsfx = $cuttingsfx
@onready var nav_agent = $NavigationAgent3D
@onready var player = $"../../karakter"
# Logika catching
var is_catching_player = false
const SPEED = 2.0
var destination = Vector3.ZERO
var gravity = 0.3

func _ready():
	Animationlogger.play('cutting')  # Mulai animasi
	cuttingsfx.play()       # Mainkan efek suara
	if player:
		print("Player node found")
	else:
		print("Player node not found")
		

func _physics_process(delta):
	velocity = Vector3.ZERO
	print("posisi karakter : ", player.global_position)
	print("posisi logger : ", self.global_position)
	
	if global_position.distance_to(player.global_position) < 1.5:
		if Input.is_action_just_pressed("catch"):
			is_catching_player = true
			if is_catching_player:
				get_tree().change_scene_to_file("res://win.tscn")
			
	elif global_position.distance_to(player.global_position) < 3:
		print("LARIIII!")
		path_finding()
		look_at(Vector3(global_position.x + velocity.x, global_position.y, global_position.z + velocity.z), Vector3.UP)
		Animationlogger.play('run')
		cuttingsfx.stop()
		
	if not is_on_floor():
		position.y -= gravity * delta
		
	move_and_slide()
		
func path_finding():
	velocity =  (global_transform.origin).normalized() * SPEED

#func path_finding(delta):
	#destination = player.global_position
	#nav_agent.set_target_location(destination)  # Tetapkan lokasi tujuan ke agen navigasi
	#
	#if nav_agent.is_navigation_finished():
		#return  # Jika sudah sampai tujuan, hentikan
		#
	#var next_position = nav_agent.get_next_location()
	#velocity = (next_position - global_position).normalized() * SPEED
	#move_and_slide()
