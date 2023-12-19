extends Control



func _on_options_focus_entered():
	$HoverSound.play()


func _on_quit_focus_entered():
	$HoverSound.play()


func _on_multi_player_focus_entered():
	$HoverSound.play()


func _on_single_player_focus_entered():
	$HoverSound.play()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		quitGame()


func quitGame():
	get_tree().quit(0)


func _on_quit_pressed():
	get_tree().quit(0)


func _on_multi_player_pressed():
	Settings.setMultiplayer(true)
	get_tree().change_scene_to_file("res://root.tscn")


func _on_single_player_pressed():
	Settings.setMultiplayer(false)
	get_tree().change_scene_to_file("res://root.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://options_ui.tscn") # Replace with function body.
