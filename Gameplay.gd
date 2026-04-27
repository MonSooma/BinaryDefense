extends Node2D

@export var hornet_scene: PackedScene
@onready var binary_system = $PANEL
var code
var score

signal resetbits

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	$GAMEOVER.hide()
	$GAMEOVER2.hide()
	$NewGame.hide()
	$MainMenu.hide()
	$StartAlarm.play()
	binary_system.enter_pressed.connect(_on_binary_enter_pressed)
	$spawntimer.start()
	$musictimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	$score.text = str(score)
	
	if score > 12:
		$spawntimer.wait_time = 3 * (0.975 ** score) + 3.5
	#print($spawntimer.wait_time)

func _on_spawntimer_timeout():
	spawn_hornet()
	
func _on_musictimer_timeout():
	$Music.play()

func spawn_hornet():
	var hornet = hornet_scene.instantiate()
	hornet.position.x = randi_range($LaneL.global_position.x, $LaneR.global_position.x) #Vælger en tilfældig x-koordinat til spawn
	hornet.position.y = $LaneL.global_position.y #Vælger den samme y-koordinat til spawn
	print(hornet.hornet_decimalnumber)
	get_tree().current_scene.add_child(hornet)

func _on_binary_enter_pressed(codenumber):
	print("Received:", codenumber)
	code = codenumber
	var hornets = get_tree().get_nodes_in_group("hornets") #Fremkalder
	for hornet in hornets:
		print(hornet.hornet_decimalnumber)
		if hornet.hornet_decimalnumber == codenumber:
			hornet.explode()
			$HornetDS.play()
			emit_signal("resetbits")
			score += 1
			

func _on_area_2d_body_entered(body: Node2D): #GAME OVER
	if body.is_in_group("hornets"):
		print("GAME OVER")
		$spawntimer.stop()
		$Music.stop()
		var hornets = get_tree().get_nodes_in_group("hornets")
		for hornet in hornets:
			hornet.queue_free()
		$GAMEOVER.show()
		$GAMEOVER2.show()
		$NewGame.show()
		$MainMenu.show()


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Gameplay.tscn")



func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
