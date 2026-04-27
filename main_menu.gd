extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Information.hide()
	$BACK.hide()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Gameplay.tscn")


func _on_info_pressed():
	$Binary_txt.hide()
	$Binary_txt2.hide()
	$Defense_txt.hide()
	$Defense_txt2.hide()
	$Play.hide()
	$Info.hide()
	$Settings.hide()
	$Quit.hide()
	
	$Information.show()
	$BACK.show()


func _on_settings_pressed():
	pass


func _on_quit_pressed():
	get_tree().quit()

func _on_back_pressed():
	$Binary_txt.show()
	$Binary_txt2.show()
	$Defense_txt.show()
	$Defense_txt2.show()
	$Play.show()
	$Info.show()
	$Settings.show()
	$Quit.show()
	
	$Information.hide()
	$BACK.hide()
